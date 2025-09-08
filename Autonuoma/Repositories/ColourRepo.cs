namespace Org.Ktu.Isk.P175B602.Autonuoma.Repositories;

using Org.Ktu.Isk.P175B602.Autonuoma.Models;

public class ColourRepo : RepoBase
{
    public static List<Colour> List()
    {
        string query = $@"SELECT * FROM `{Config.TblPrefix}colours` ORDER BY id_COLOUR ASC";
        var drc = Sql.Query(query);

        var result = 
            Sql.MapAll<Colour>(drc, (dre, t) => {
                t.Id = dre.From<int>("id_COLOUR");
                t.Name = dre.From<string>("name");
                t.Shade = dre.From<string>("colourShade");
            });

        return result;
    }

    public static Colour Find(int id)
    {
        var query = $@"SELECT * FROM `{Config.TblPrefix}colours` WHERE id_COLOUR=?id";
        var drc = Sql.Query(query, args => {
            args.Add("?id", id);
        });

        var result = 
            Sql.MapOne<Colour>(drc, (dre, t) => {
                t.Id = dre.From<int>("id_COLOUR");
                t.Name = dre.From<string>("name");
                t.Shade = dre.From<string>("colourShade");
            });

        return result;
    }

    public static void Update(Colour colour)
    {			
        var query = 
            $@"UPDATE `{Config.TblPrefix}colours` 
            SET 
                name=?name,
                colourShade=?shade
            WHERE 
                id_COLOUR=?id";

        Sql.Update(query, args => {
            args.Add("?name", colour.Name);
            args.Add("?shade", colour.Shade);
            args.Add("?id", colour.Id);
        });							
    }

    public static void Insert(Colour colour)
    {			
        var query = $@"INSERT INTO `{Config.TblPrefix}colours` 
                      (name, colourShade) 
                      VALUES (?name, ?shade)";
        
        Sql.Insert(query, args => {
            args.Add("?name", colour.Name);
            args.Add("?shade", colour.Shade);
        });
    }

    public static void Delete(int id)
    {			
        var query = $@"DELETE FROM `{Config.TblPrefix}colours` WHERE id_COLOUR=?id";
        Sql.Delete(query, args => {
            args.Add("?id", id);
        });			
    }


public static void InitializeColours()
{
    int startId = 10;
    
    for (int i = 0; i < 20; i++)
    {
        var colour = new Colour 
        { 
            Name = $"Color-{startId + i}",
            Shade = (i % 10 + 1).ToString()
        };

        try
        {
            Insert(colour);
        }
        catch
        {
            // If exists, update instead
            Update(colour);
        }
    }
}



}