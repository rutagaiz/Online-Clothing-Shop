namespace Org.Ktu.Isk.P175B602.Autonuoma.Models.OrdersF2;

using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;


/// <summary>
/// 'Orders' in list form.
/// </summary>
public class OrdersL
{
	[Display(Name="Nr.")]
	public int Nr { get; set; }

	[Display(Name="Sudarymo data")]
	[DataType(DataType.Date)]
	[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
	public DateTime Data { get; set; }

	[Display(Name="User")]
	public string User { get; set; }

	[Display(Name="Email")]
	public string Email { get; set; }

	[Display(Name="Būsena")]
	public string Busena { get; set; }
}









public class OrdersCE
{
	public class OrdersM
	{
	[Display(Name = "Order ID")]
        public int id_ORDER { get; set; }

        [Display(Name = "Start Date")]
        [DataType(DataType.Date)]
        [Required]
        public DateTime startDate { get; set; }

        [Display(Name = "End Date")]
        [DataType(DataType.Date)]
        [Required]
        public DateTime endDate { get; set; } 

        [Display(Name = "Total Items")]
        [Required]
        public int numberOfItems { get; set; }

        [Display(Name = "Total Price")]
        [Required]
        public decimal totalPrice { get; set; }

        [Display(Name = "Delivery Cost")]
        [Required]
        public decimal costOfDelivery { get; set; } 

        [Display(Name = "Estimated Delivery")]
        [DataType(DataType.Date)]
        [Required]
        public DateTime estimatedDeliveryDate { get; set; }

        [Display(Name = "Status")]
        [Required]
        public string orderState { get; set; } 

        [Display(Name = "Discount %")]
        public int? discount { get; set; }

        [Display(Name = "Discount Code")]
        public string discountCode { get; set; }

        [Display(Name = "Customer")]
        [Required]
        public int fk_USER { get; set; }
	}



	public class UzsakytaPaslaugaM
	{
	public int InListId { get; set; }

        [Display(Name = "Product")]
        [Required]
        public int? fk_PRODUCT { get; set; }

        [Display(Name = "Quantity")]
        [Required]
        [Range(1, int.MaxValue)]
        public int quantity { get; set; } = 1;

        [Display(Name = "Subtotal")]
        [Required]
        public decimal subTotal { get; set; }
	}



	public class ListsM
	{
        public IList<SelectListItem> Users { get; set; }
        public IList<SelectListItem> Products { get; set; }
        public IList<SelectListItem> OrderStates { get; set; }
	}



	public OrdersM Orders { get; set; } = new OrdersM();
	public IList<UzsakytaPaslaugaM> UzsakytosPaslaugos { get; set;  } = new List<UzsakytaPaslaugaM>();
	public ListsM Lists { get; set; } = new ListsM();
}






/// <summary>
/// 'SutartiesBusena' enumerator in lists.
/// /// </summary>
public class SutartiesBusena
{
	public int Id { get; set; }

	public string Name { get; set; }
}