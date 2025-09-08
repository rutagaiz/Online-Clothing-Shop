namespace Org.Ktu.Isk.P175B602.Autonuoma.Controllers;

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

using Newtonsoft.Json;

using Org.Ktu.Isk.P175B602.Autonuoma.Repositories;
using Org.Ktu.Isk.P175B602.Autonuoma.Models.OrdersF2;



public class OrdersF2Controller : ControllerBase
{
	/// <summary>
	/// This is invoked when either 'Index' action is requested or no action is provided.
	/// </summary>
	/// <returns>Entity list view.</returns>
	[HttpGet]
	public ActionResult Index()
	{
		return View(OrdersF2Repo.ListOrders());
	}

	/// <summary>
	/// This is invoked when creation form is first opened in a browser.
	/// </summary>
	/// <returns>Entity creation form.</returns>
	[HttpGet]
	public ActionResult Create()
	{
		var sutCE = new OrdersCE();

		sutCE.Orders.startDate = DateTime.Now;
		sutCE.Orders.estimatedDeliveryDate = DateTime.Today.AddDays(5);
		
		PopulateLists(sutCE);

		return View(sutCE);
	}


[HttpPost]
public ActionResult Create(int? save, int? add, int? remove, OrdersCE sutCE)
{
    // Add new product line?
    if (add != null)
    {
        var up = new OrdersCE.UzsakytaPaslaugaM
        {
            InListId = sutCE.UzsakytosPaslaugos.Count > 0
                ? sutCE.UzsakytosPaslaugos.Max(it => it.InListId) + 1
                : 0,

            fk_PRODUCT = null,
            quantity = 0,
            subTotal = 0
        };

        sutCE.UzsakytosPaslaugos.Add(up);

        ModelState.Clear(); // Reset form state so the updated list is used
        PopulateLists(sutCE);
        return View(sutCE);
    }

    // Remove product line?
    if (remove != null)
    {
        sutCE.UzsakytosPaslaugos = sutCE.UzsakytosPaslaugos
            .Where(it => it.InListId != remove.Value)
            .ToList();

        ModelState.Clear();
        PopulateLists(sutCE);
        return View(sutCE);
    }

    // Save form?
    if (save != null)
    {
        // Check for duplicate product entries
        for (var i = 0; i < sutCE.UzsakytosPaslaugos.Count - 1; i++)
        {
            var refUp = sutCE.UzsakytosPaslaugos[i];

            for (var j = i + 1; j < sutCE.UzsakytosPaslaugos.Count; j++)
            {
                var testUp = sutCE.UzsakytosPaslaugos[j];

                if (testUp.fk_PRODUCT == refUp.fk_PRODUCT)
                {
                    ModelState.AddModelError(
                        $"UzsakytosPaslaugos[{j}].fk_PRODUCT",
                        "This product is already added."
                    );
                }
            }
        }

		if (sutCE.Orders.endDate < sutCE.Orders.startDate) 
		{
			ModelState.AddModelError("Orders.endDate", "Pabaigos data negali būti ankstesnė už pradžios datą");
			ViewData["error"] = "Pabaigos data turi būti vėlesnė nei pradžios data.";
		}

        // If validation passes
        if (ModelState.IsValid)
        {
            // Insert the main order
            sutCE.Orders.id_ORDER = OrdersF2Repo.InsertOrders(sutCE);

            // Insert each ordered product
            foreach (var upVm in sutCE.UzsakytosPaslaugos)
            {
                OrdersF2Repo.InsertUzsakytaPaslauga(sutCE.Orders.id_ORDER, upVm);
            }

            return RedirectToAction("Index");
        }
        else
        {
            PopulateLists(sutCE);
            return View(sutCE);
        }
    }

    throw new Exception("Should not reach here.");
}


	/// <summary>
	/// This is invoked when editing form is first opened in browser.
	/// </summary>
	/// <param name="id">ID of the entity to edit.</param>
	/// <returns>Editing form view.</returns>
	[HttpGet]
	public ActionResult Edit(int id)
	{
		var sutCE = OrdersF2Repo.FindOrdersCE(id);
		
		sutCE.UzsakytosPaslaugos = OrdersF2Repo.ListUzsakytaPaslauga(id);			
		PopulateLists(sutCE);

		return View(sutCE);
	}

	/// <summary>
	/// This is invoked when buttons are pressed in the editing form.
	/// </summary>
	/// <param name="id">ID of the entity being edited</param>
	/// <param name="save">If not null, indicates that 'Save' button was clicked.</param>
	/// <param name="add">If not null, indicates that 'Add' button was clicked.</param>
	/// <param name="remove">If not null, indicates that 'Remove' button was clicked and contains in-list-id of the item to remove.</param>
	/// <param name="sutCE">Entity view model filled with latest data.</param>
	/// <returns>Returns editing from view or redired back to Index if save is successfull.</returns>
	[HttpPost]
	public ActionResult Edit(int id, int? save, int? add, int? remove, OrdersCE sutCE)
	{
		//addition of new 'UzsakytosPaslaugos' record was requested?
		if( add != null )
		{
			//add entry for the new record
			var up =
				new OrdersCE.UzsakytaPaslaugaM {
					InListId =
						sutCE.UzsakytosPaslaugos.Count > 0 ?
						sutCE.UzsakytosPaslaugos.Max(it => it.InListId) + 1 :
						0,

					fk_PRODUCT = null,
           			quantity = 0,
            		subTotal = 0
				};
			sutCE.UzsakytosPaslaugos.Add(up);

			//make sure @Html helper is not reusing old model state containing the old list
			ModelState.Clear();

			//go back to the form
			PopulateLists(sutCE);
			return View(sutCE);
		}

		//removal of existing 'UzsakytosPaslaugos' record was requested?
		if( remove != null )
		{
			//filter out 'UzsakytosPaslaugos' record having in-list-id the same as the given one
			sutCE.UzsakytosPaslaugos =
				sutCE
					.UzsakytosPaslaugos
					.Where(it => it.InListId != remove.Value)
					.ToList();

			//make sure @Html helper is not reusing old model state containing the old list
			ModelState.Clear();

			//go back to the form
			PopulateLists(sutCE);
			return View(sutCE);
		}

		//save of the form data was requested?
		if( save != null )
		{
			//check for attemps to create duplicate 'UzsakytaPaslauga'records
			for( var i = 0; i < sutCE.UzsakytosPaslaugos.Count-1; i ++ )
			{
				var refUp = sutCE.UzsakytosPaslaugos[i];

				for( var j = i+1; j < sutCE.UzsakytosPaslaugos.Count; j++ )
				{
					var testUp = sutCE.UzsakytosPaslaugos[j];
					
					if (testUp.fk_PRODUCT == refUp.fk_PRODUCT)
                {
                    ModelState.AddModelError(
                        $"UzsakytosPaslaugos[{j}].fk_PRODUCT", 
                        "Ši prekė jau pridėta"
                    );
                }
				}
			}

			if (sutCE.Orders.endDate < sutCE.Orders.startDate) 
		{
			ModelState.AddModelError("Orders.endDate", "Pabaigos data negali būti ankstesnė už pradžios datą");
			ViewData["error"] = "Pabaigos data turi būti vėlesnė nei pradžios data.";
		}

			//form field validation passed?
			if( ModelState.IsValid )
			{
				//update 'Orders'
				OrdersF2Repo.UpdateOrders(sutCE);

				//delete all old 'UzsakytosPaslaugos' records
				OrdersF2Repo.DeleteUzsakytaPaslaugaForOrders(sutCE.Orders.id_ORDER);

				//create new 'UzsakytosPaslaugos' records
				foreach( var upVm in sutCE.UzsakytosPaslaugos )
					OrdersF2Repo.InsertUzsakytaPaslauga(sutCE.Orders.id_ORDER, upVm);

				//save success, go back to the entity list
				return RedirectToAction("Index");
			}
			//form field validation failed, go back to the form
			else
			{
				PopulateLists(sutCE);
				return View(sutCE);
			}
		}

		//should not reach here
		throw new Exception("Should not reach here.");
	}

	/// <summary>
	/// This is invoked when deletion form is first opened in browser.
	/// </summary>
	/// <param name="id">ID of the entity to delete.</param>
	/// <returns>Deletion form view.</returns>
	[HttpGet]
	public ActionResult Delete(int id)
	{
		var sutCE = OrdersF2Repo.FindOrdersCE(id);
		return View(sutCE);
	}

[HttpPost]
public ActionResult DeleteConfirm(int id)
{
    // try
    // {


	// 	// if (sutCE == null)
    //     // {
    //     //     TempData["ErrorMessage"] = "Užsakymas nerastas";
    //     //     return RedirectToAction("Index");
    //     // }


    //     // if (sutCE.Orders.orderState != "ordered" && sutCE.Orders.orderState != "cancelled")
    //     // {
    //     //     TempData["ErrorMessage"] = "Užsakymą galima šalinti tik 'Nauja' arba 'Atšaukta' būsenoje";
    //     //     return RedirectToAction("Delete", new { id });
    //     // }

    //     // // Delete all associated products first
    //     // OrdersF2Repo.DeleteUzsakytaPaslaugaForOrders(id);
        
    //     // // Then delete the main order
    //     // OrdersF2Repo.DeleteOrders(id);

    //     // TempData["SuccessMessage"] = "Užsakymas sėkmingai pašalintas";
    //     // return RedirectToAction("Index");
    // }
    // catch (Exception ex)
    // {
    //     Console.WriteLine($"Error deleting order: {ex.Message}");
    //     TempData["ErrorMessage"] = "Įvyko klaida trinant užsakymą. Bandykite dar kartą.";
    //     return RedirectToAction("Delete", new { id });
    // }


	        // Get the order with its current state
        var sutCE = OrdersF2Repo.FindOrdersCE(id);
		if (sutCE.Orders.orderState == "ordered" || sutCE.Orders.orderState == "cancelled")
        {
            OrdersF2Repo.DeleteUzsakytaPaslaugaForOrders(id);
			OrdersF2Repo.DeleteOrders(id);
			return RedirectToAction("Index");
        }
		else{
			ViewData["deletionNotPermitted"] = true;
			return View("Delete", sutCE);
		}

		
}

	/// <summary>
	/// Populates select lists used to render drop down controls.
	/// </summary>
	/// <param name="sutCE">'Orders' view model to append to.</param>
	private void PopulateLists(OrdersCE sutCE)
	{
		var vartotojai = KlientasRepo.List(); 					
		var produktai = ProductsRepo.ListProducts();		
		var busenos = OrdersF2Repo.ListSutartiesBusena();	    


		sutCE.Lists.Users = vartotojai
        .Select(k => new SelectListItem
        {
            Value = k.id_USER.ToString(),
            Text = $"{k.name} {k.surname} ({k.email})"
        })
        .OrderBy(x => x.Text)
        .ToList();

	    sutCE.Lists.Users.Insert(0, new SelectListItem 
    	{ 
        Value = "", 
        Text = "-- Select Customer --" 
    	});





		sutCE.Lists.Products = produktai
        .Select(a => new SelectListItem
        {
            Value = a.id_PRODUCT.ToString(),
            Text = $"{a.name} - {a.cost}€ ({a.size}, {a.country})"
        })
        .OrderBy(x => x.Text)
        .ToList();

	    sutCE.Lists.Products.Insert(0, new SelectListItem 
    	{	 
        Value = "", 
        Text = "-- Select Product --" 
    	});






		sutCE.Lists.OrderStates = busenos
    	.Select(b => new SelectListItem
    	{
        	Value = b.Key,
        	Text = b.Value
    	})
    	.OrderBy(x => x.Text)
    	.ToList();

		sutCE.Lists.OrderStates.Insert(0, new SelectListItem 
		{ 
    		Value = "", 
    		Text = "-- Select Status --" 
		});

		
	}
}
