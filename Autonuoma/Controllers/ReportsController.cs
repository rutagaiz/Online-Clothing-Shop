namespace Org.Ktu.Isk.P175B602.Autonuoma.Controllers;

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;


using Org.Ktu.Isk.P175B602.Autonuoma.Repositories;

using OrdersReport = Org.Ktu.Isk.P175B602.Autonuoma.Models.OrdersReport;


public class ReportsController : ControllerBase
{
	[HttpGet]
public ActionResult Contracts(DateTime? dateFrom, DateTime? dateTo, string clientName, string orderState)
{
	if (dateFrom.HasValue && dateTo.HasValue && dateTo < dateFrom)
	{
		ViewData["error"] = "Pabaigos data negali būti ankstesnė už pradžios datą.";
	}
	
	var report = new OrdersReport.Report
	{
		DateFrom = dateFrom,
		DateTo = dateTo?.AddHours(23).AddMinutes(59).AddSeconds(59),
		ClientName = clientName,
		OrderState = orderState,
		OrderStates = OrdersF2Repo.ListSutartiesBusena()
			.Select(s => new SelectListItem { Value = s.Key, Text = s.Value }).ToList()
	};

	report.Orders = AtaskaitaRepo.GetOrders(report.DateFrom, report.DateTo, clientName, orderState);

	report.TotalQuantity = report.Orders.Sum(x => x.QuantityOrdered);
	report.TotalSum = report.Orders.Sum(x => x.TotalValue);
	report.AverageOrderValue = report.Orders.Any() ? report.Orders.Average(x => x.AverageOrderValue) : 0;

	return View("Orders", report); 
}

}
