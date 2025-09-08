namespace Org.Ktu.Isk.P175B602.Autonuoma.Repositories;

using OrdersReport = Org.Ktu.Isk.P175B602.Autonuoma.Models.OrdersReport;


/// <summary>
/// Database operations related to reports.
/// </summary>
public class AtaskaitaRepo : RepoBase
{
	public static List<OrdersReport.OrderRow> GetOrders(DateTime? dateFrom, DateTime? dateTo, string clientName, string orderState)
	{
		var query = $@"
	SELECT 
		CONCAT(u.name, ' ', u.surname) AS UserFullName,
		p.name AS ProductName,
		c.name AS Colour,
		p.season AS Season,
		o.orderState AS OrderStatus,
		SUM(oi.quantity) AS QuantityOrdered,
		SUM(oi.subTotal) AS TotalValue,
		SUM(oi.subTotal) / COUNT(DISTINCT o.id_ORDER) AS AverageOrderValue,
		COUNT(DISTINCT o.id_ORDER) AS OrderCount,
		MAX(o.startDate) AS LastOrderDate
	FROM orders o
	LEFT JOIN order_items oi ON oi.fk_ORDER = o.id_ORDER
	LEFT JOIN products p ON oi.fk_PRODUCT = p.id_PRODUCT
	LEFT JOIN colours c ON p.fk_COLOUR = c.id_COLOUR
	LEFT JOIN users u ON o.fk_USER = u.id_USER
	WHERE 
		(@dateFrom IS NULL OR o.startDate >= @dateFrom) AND
		(@dateTo IS NULL OR o.startDate <= @dateTo) AND
		(@clientName IS NULL OR u.name LIKE CONCAT(@clientName, '%') OR u.surname LIKE CONCAT(@clientName, '%')) AND
		(@orderState IS NULL OR o.orderState = @orderState)
	GROUP BY u.id_USER, p.id_PRODUCT, o.orderState, c.id_COLOUR, p.season
	ORDER BY TotalValue DESC";

		var drc = Sql.Query(query, args =>
		{
			args.Add("@dateFrom", dateFrom);
			args.Add("@dateTo", dateTo);
			args.Add("@clientName", string.IsNullOrWhiteSpace(clientName) ? null : clientName);
			args.Add("@orderState", string.IsNullOrWhiteSpace(orderState) ? null : orderState);
		});

		var result = Sql.MapAll<OrdersReport.OrderRow>(drc, (dre, t) =>
		{
			t.UserFullName = dre.From<string>("UserFullName");
			t.ProductName = dre.From<string>("ProductName");
			t.Colour = dre.From<string>("Colour");
			t.Season = dre.From<string>("Season");
			t.QuantityOrdered = dre.From<int?>("QuantityOrdered") ?? 0;
			t.TotalValue = dre.From<decimal?>("TotalValue") ?? 0;
			t.AverageOrderValue = dre.From<decimal?>("AverageOrderValue") ?? 0;
			t.OrderCount = dre.From<int?>("OrderCount") ?? 0;
			t.LastOrderDate = dre.From<DateTime?>("LastOrderDate");
			t.OrderStatus = dre.From<string>("OrderStatus");
		});

		return result;
	}
}
