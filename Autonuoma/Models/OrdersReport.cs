namespace Org.Ktu.Isk.P175B602.Autonuoma.Models.OrdersReport;

using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;


/// <summary>
/// View model for single contract in a report.
/// </summary>
public class OrderRow
{
	public string UserFullName { get; set; }
	public string ProductName { get; set; }
	public string Colour { get; set; }
	public string Season { get; set; }
	public int QuantityOrdered { get; set; }
	public decimal TotalValue { get; set; }
	public decimal AverageOrderValue { get; set; }
	public int OrderCount { get; set; }
	public DateTime? LastOrderDate { get; set; }
	public string OrderStatus { get; set; }
}

/// <summary>
/// View model for whole report.
/// </summary>
public class Report
{
	[DataType(DataType.Date)]
	public DateTime? DateFrom { get; set; }

	[DataType(DataType.Date)]
	public DateTime? DateTo { get; set; }

	public string ClientName { get; set; }

	public string OrderState { get; set; }

	public List<SelectListItem> OrderStates { get; set; }

	public List<OrderRow> Orders { get; set; }

	public int TotalQuantity { get; set; }
	public decimal TotalSum { get; set; }
	public decimal AverageOrderValue { get; set; }
}
