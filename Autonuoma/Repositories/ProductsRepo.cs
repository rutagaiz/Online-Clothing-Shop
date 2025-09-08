namespace Org.Ktu.Isk.P175B602.Autonuoma.Repositories;

using Org.Ktu.Isk.P175B602.Autonuoma.Models.Products;



public class ProductsRepo : RepoBase
{
	public static List<ProductsL> ListProducts()
	{
		var query = $@"SELECT * FROM `{Config.TblPrefix}products` ORDER BY id_PRODUCT ASC";
        var drc = Sql.Query(query);

        return Sql.MapAll<ProductsL>(drc, (dre, t) => {
            t.id_PRODUCT = dre.From<int>("id_PRODUCT");
            t.name = dre.From<string>("name");
            t.cost = dre.From<double>("cost");
            t.size = dre.From<string>("size")[0];
            t.country = dre.From<string>("country");
        });
	}

	public static ProductsCE FindProductsCE(int id)
	{
		var query = $@"SELECT * FROM `{Config.TblPrefix}products` WHERE id_PRODUCT=?id";
        var drc = Sql.Query(query, args => { args.Add("?id", id); });

        return Sql.MapOne<ProductsCE>(drc, (dre, t) => {
            t.Products.id_PRODUCT = dre.From<int>("id_PRODUCT");
            t.Products.name = dre.From<string>("name");
            t.Products.cost = dre.From<float>("cost");
            t.Products.description = dre.From<string>("description");
            t.Products.season = dre.From<string>("season");
            t.Products.country = dre.From<string>("country");
            t.Products.size = dre.From<char>("size");
            t.Products.material = dre.From<string>("material");
            t.Products.fk_STOCK = dre.From<int>("fk_STOCK");
            t.Products.fk_CATEGORY = dre.From<int>("fk_CATEGORY");
            t.Products.fk_COLOUR = dre.From<int>("fk_COLOUR");
        });
	}

	public static void InsertProducts(ProductsCE productCE)
	{
		 var query = $@"INSERT INTO `{Config.TblPrefix}products`
                      (name, cost, description, season, country, size, material, fk_STOCK, fk_CATEGORY, fk_COLOUR)
                      VALUES(?name, ?cost, ?desc, ?season, ?country, ?size, ?material, ?stock, ?cat, ?color)";

        Sql.Insert(query, args => {
            args.Add("?name", productCE.Products.name);
            args.Add("?cost", productCE.Products.cost);
            args.Add("?desc", productCE.Products.description);
            args.Add("?season", productCE.Products.season);
            args.Add("?country", productCE.Products.country);
            args.Add("?size", productCE.Products.size);
            args.Add("?material", productCE.Products.material);
            args.Add("?stock", productCE.Products.fk_STOCK);
            args.Add("?cat", productCE.Products.fk_CATEGORY);
            args.Add("?color", productCE.Products.fk_COLOUR);
        });
	}

	public static void UpdateProducts(ProductsCE productCE)
	{
		var query = $@"UPDATE `{Config.TblPrefix}products`
                      SET name=?name, cost=?cost, description=?desc, season=?season,
                          country=?country, size=?size, material=?material,
                          fk_STOCK=?stock, fk_CATEGORY=?cat, fk_COLOUR=?color
                      WHERE id_PRODUCT=?id";

        Sql.Update(query, args => {
            args.Add("?name", productCE.Products.name);
            args.Add("?cost", productCE.Products.cost);
            args.Add("?desc", productCE.Products.description);
            args.Add("?season", productCE.Products.season);
            args.Add("?country", productCE.Products.country);
            args.Add("?size", productCE.Products.size);
            args.Add("?material", productCE.Products.material);
            args.Add("?stock", productCE.Products.fk_STOCK);
            args.Add("?cat", productCE.Products.fk_CATEGORY);
            args.Add("?color", productCE.Products.fk_COLOUR);
        });
	}


	public static void DeleteProducts(int id)
	{
        var query = $@"DELETE FROM `{Config.TblPrefix}products` WHERE id_PRODUCT=?id";
        Sql.Delete(query, args => { args.Add("?id", id); });
	}

	    public static List<Stock> ListStocks()
    {
        var query = $@"SELECT * FROM `{Config.TblPrefix}stocks` ORDER BY id ASC";
        var drc = Sql.Query(query);
        return Sql.MapAll<Stock>(drc, (dre, t) => {
            t.Id = dre.From<int>("id");
            t.Name = dre.From<string>("name");
        });
    }

    public static List<Category> ListCategories()
    {
        var query = $@"SELECT * FROM `{Config.TblPrefix}categories` ORDER BY id ASC";
        var drc = Sql.Query(query);
        return Sql.MapAll<Category>(drc, (dre, t) => {
            t.Id = dre.From<int>("id");
            t.Name = dre.From<string>("name");
        });
    }

    public static List<Color> ListColors()
    {
        var query = $@"SELECT * FROM `{Config.TblPrefix}colors` ORDER BY id ASC";
        var drc = Sql.Query(query);
        return Sql.MapAll<Color>(drc, (dre, t) => {
            t.Id = dre.From<int>("id");
            t.Name = dre.From<string>("name");
        });
    }
}
