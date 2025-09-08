namespace Org.Ktu.Isk.P175B602.Autonuoma.Models.Products;

using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;



public class ProductsL
{
	[Display(Name = "ID")]
    public int id_PRODUCT { get; set; }

    [Display(Name = "Name")]
    public string name { get; set; }

    [Display(Name = "Price")]
    public double cost { get; set; }

    [Display(Name = "Size")]
    public char size { get; set; }

    [Display(Name = "Country")]
    public string country { get; set; }
}

/// <summary>
/// 'Automobilis' in create and edit forms.
/// </summary>
public class ProductsCE
{
	/// <summary>
	/// Automobilis.
	/// </summary>
	public class ProductsM
	{
		[Display(Name = "ID")]
        public int id_PRODUCT { get; set; }

        [Display(Name = "Name")]
        [Required]
        [MaxLength(20)]
        public string name { get; set; }

        [Display(Name = "Price")]
        [Required]
        public double cost { get; set; }

        [Display(Name = "Description")]
        [Required]
        [MaxLength(255)]
        public string description { get; set; }

        [Display(Name = "Season")]
        [Required]
        [MaxLength(6)]
        public string season { get; set; }

        [Display(Name = "Country")]
        [Required]
        [MaxLength(28)]
        public string country { get; set; }

        [Display(Name = "Size")]
        [Required]
        public char size { get; set; }

        [Display(Name = "Material")]
        [Required]
        [MaxLength(20)]
        public string material { get; set; }

        [Display(Name = "Stock")]
        [Required]
        public int fk_STOCK { get; set; }

        [Display(Name = "Category")]
        [Required]
        public int fk_CATEGORY { get; set; }

        [Display(Name = "Color")]
        [Required]
        public int fk_COLOUR { get; set; }
	}

	/// <summary>
	/// Select lists for making drop downs for choosing values of entity fields.
	/// </summary>
	public class ListsM
	{
		public IList<SelectListItem> Stocks { get; set; }
        public IList<SelectListItem> Categories { get; set; }
        public IList<SelectListItem> Colors { get; set; }

	}


	/// <summary>
	/// Automobilis.
	/// </summary>
	public ProductsM Products { get ; set; } = new ProductsM();

	/// <summary>
	/// Lists for drop down controls.
	/// </summary>
	public ListsM Lists { get; set; } = new ListsM();
}




// Additional classes for dropdown lists
public class Stock
{
    public int Id { get; set; }
    public string Name { get; set; }
}

public class Category
{
    public int Id { get; set; }
    public string Name { get; set; }
}

public class Color
{
    public int Id { get; set; }
    public string Name { get; set; }
}
