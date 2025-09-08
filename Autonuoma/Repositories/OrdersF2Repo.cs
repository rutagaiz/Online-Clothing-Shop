namespace Org.Ktu.Isk.P175B602.Autonuoma.Repositories;

using Newtonsoft.Json;

using Org.Ktu.Isk.P175B602.Autonuoma.Models.OrdersF2;


/// <summary>
/// Database operations related to 'Orders' entity.
/// </summary>
public class OrdersF2Repo : RepoBase
{

	public static List<OrdersL> ListOrders()
	{
    var query =
        $@"SELECT
                o.id_ORDER as nr,
                o.startDate as data,
                CONCAT(u.name, ' ', u.surname) as user,
                u.email as email,
                o.orderState as busena
            FROM
                `{Config.TblPrefix}orders` o
            LEFT JOIN `{Config.TblPrefix}users` u ON o.fk_USER = u.id_USER
            ORDER BY o.id_ORDER DESC";

    var drc = Sql.Query(query);

    var result =
        Sql.MapAll<OrdersL>(drc, (dre, t) =>
        {
            t.Nr = dre.From<int>("nr");
            t.Data = dre.From<DateTime>("data");
            t.User = dre.From<string>("user");
            t.Busena = dre.From<string>("busena");
            t.Email = dre.From<string>("email");
        });

    return result;
	}




	public static OrdersCE FindOrdersCE(int id)
	{
		var query = $@"SELECT * FROM `{Config.TblPrefix}orders` WHERE id_ORDER=?id";
        var drc = Sql.Query(query, args => { args.Add("?id", id); });

        var result =
            Sql.MapOne<OrdersCE>(drc, (dre, t) => {
                var order = t.Orders;

                order.id_ORDER = dre.From<int>("id_ORDER");
                order.startDate = dre.From<DateTime>("startDate");
                order.endDate = dre.From<DateTime>("endDate");
                order.numberOfItems = dre.From<int>("numberOfItems");
                order.totalPrice = dre.From<int>("totalPrice");
                order.costOfDelivery = dre.From<decimal>("costOfDelivery");
                order.estimatedDeliveryDate = dre.From<DateTime>("estimatedDeliveryDate");
                order.orderState = dre.From<string>("orderState");
                order.discount = dre.From<int?>("discount");
                order.discountCode = dre.From<string>("discountCode");
                order.fk_USER = dre.From<int>("fk_USER");
            });

        // Load order items
        result.UzsakytosPaslaugos = ListUzsakytaPaslauga(id); // result.OrderItems = ListOrderItems(id);
        
        return result;
	}

	public static int InsertOrders(OrdersCE sutCE)
	{
		var query =
            $@"INSERT INTO `{Config.TblPrefix}orders`
            (
                startDate, endDate, numberOfItems, totalPrice,
                costOfDelivery, estimatedDeliveryDate, orderState,
                discount, discountCode, fk_USER
            )
            VALUES(
                ?start, ?end, ?items, ?total,
                ?delivery, ?deliveryDate, ?state,
                ?discount, ?code, ?user
            )";

		var id =
			Sql.Insert(query, args => {
                var order = sutCE.Orders;

                args.Add("?start", order.startDate);
                args.Add("?end", order.endDate);
                args.Add("?items", order.numberOfItems);
                args.Add("?total", order.totalPrice);
                args.Add("?delivery", order.costOfDelivery);
                args.Add("?deliveryDate", order.estimatedDeliveryDate);
                args.Add("?state", order.orderState);


                args.Add("?discount", order.discount);
                args.Add("?code", order.discountCode);

                // args.Add("?discount", order.discount ?? (object)DBNull.Value);
                // args.Add("?code", order.discountCode ?? (object)DBNull.Value);

                args.Add("?user", order.fk_USER);
            });

		foreach (var item in sutCE.UzsakytosPaslaugos)
        {
            InsertUzsakytaPaslauga((int)id, item);
        }

        return (int)id;
	}

	public static void UpdateOrders(OrdersCE sutCE)
	{
		var query =
			$@"UPDATE `{Config.TblPrefix}orders`
            SET
                startDate=?start,
                endDate=?end,
                numberOfItems=?items,
                totalPrice=?total,
                costOfDelivery=?delivery,
                estimatedDeliveryDate=?deliveryDate,
                orderState=?state,
                discount=?discount,
                discountCode=?code,
                fk_USER=?user
            WHERE id_ORDER=?id";

		Sql.Update(query, args => {
			var order = sutCE.Orders;

			args.Add("?id", order.id_ORDER);
            args.Add("?start", order.startDate);
            args.Add("?end", order.endDate);
            args.Add("?items", order.numberOfItems);
            args.Add("?total", order.totalPrice);
            args.Add("?delivery", order.costOfDelivery);
            args.Add("?deliveryDate", order.estimatedDeliveryDate);
            args.Add("?state", order.orderState);
            args.Add("?discount", order.discount);
            args.Add("?code", order.discountCode);
            args.Add("?user", order.fk_USER);

		});

		// Update order items
        DeleteUzsakytaPaslaugaForOrders(sutCE.Orders.id_ORDER);
        foreach (var item in sutCE.UzsakytosPaslaugos)
        {
            InsertUzsakytaPaslauga(sutCE.Orders.id_ORDER, item);
        }
	}

public static void DeleteOrders(int id)
{
	// 1. Delete related payments (to avoid foreign key constraint issues)
	var deletePaymentsQuery = $@"DELETE FROM `{Config.TblPrefix}payments` WHERE fk_INVOICE = ?id";
	Sql.Delete(deletePaymentsQuery, args => {
		args.Add("?id", id);
	});

	// 2. Delete related order items
	DeleteUzsakytaPaslaugaForOrders(id);

	// 3. Delete the order
	var query = $@"DELETE FROM `{Config.TblPrefix}orders` WHERE id_ORDER=?id";
	Sql.Delete(query, args => {
		args.Add("?id", id);
	});
}


    

















	public static List<OrdersCE.UzsakytaPaslaugaM> ListUzsakytaPaslauga(int orderId)
    {
        var query =
            $@"SELECT *
            FROM `{Config.TblPrefix}order_items`
            WHERE fk_ORDER = ?orderId
            ORDER BY fk_PRODUCT ASC";

        var drc = Sql.Query(query, args => {
            args.Add("?orderId", orderId);
        });

        var result =
            Sql.MapAll<OrdersCE.UzsakytaPaslaugaM>(drc, (dre, t) => {
                t.fk_PRODUCT = dre.From<int>("fk_PRODUCT");
                t.quantity = dre.From<int>("quantity");
                t.subTotal = dre.From<decimal>("subTotal");
            });

        for (int i = 0; i < result.Count; i++)
            result[i].InListId = i;

        return result;
    }

	public static void InsertUzsakytaPaslauga(int orderId, OrdersCE.UzsakytaPaslaugaM item)
{
    var query = $@"INSERT INTO `{Config.TblPrefix}order_items`
                  (fk_ORDER, fk_PRODUCT, quantity, subTotal)
                  VALUES(?order, ?product, ?quantity, ?subTotal)
                  ON DUPLICATE KEY UPDATE
                  quantity = VALUES(quantity),
                  subTotal = VALUES(subTotal)";

    Sql.Insert(query, args => {
        args.Add("?order", orderId);
        args.Add("?product", item.fk_PRODUCT);
        args.Add("?quantity", item.quantity);
        args.Add("?subTotal", item.subTotal);
    });
}

	public static void DeleteUzsakytaPaslaugaForOrders(int orderId)
	{
		 var query = $@"DELETE FROM `{Config.TblPrefix}order_items` WHERE fk_ORDER=?orderId";
        Sql.Delete(query, args => {
            args.Add("?orderId", orderId);
        });
	}


	public static Dictionary<string, string> ListSutartiesBusena()
    {
        return new Dictionary<string, string>
        {
            {"ordered", "Užsakyta"},
            {"confirmed", "Patvirtinta"},
            {"inTransit", "Siunčiama"},
            {"delivered", "Pristatyta"},
            {"cancelled", "Atšaukta"}
        };
    }
}