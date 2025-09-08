namespace Org.Ktu.Isk.P175B602.Autonuoma.Repositories;

using Org.Ktu.Isk.P175B602.Autonuoma.Models;

#nullable enable

/// <summary>
/// Database operations related to 'Klientas' entity.
/// </summary>
public class KlientasRepo : RepoBase
{
	public static List<Klientas> List()
	{
        var query = $@"SELECT * FROM `{Config.TblPrefix}users` ORDER BY id_USER ASC";
        var drc = Sql.Query(query);

        return Sql.MapAll<Klientas>(drc, (dre, t) => {
            t.id_USER = dre.From<int>("id_USER");
            t.email = dre.From<string>("email");
            t.password = dre.From<string>("password");
            t.name = dre.From<string>("name");
            t.surname = dre.From<string>("surname");
            t.phoneNumber = dre.From<string?>("phoneNumber");
            t.address = dre.From<string?>("address");
        });
	}

	public static Klientas? Find(string id)
	{
        var query = $@"SELECT * FROM `{Config.TblPrefix}users` WHERE id_USER=?id";
        
        var drc = Sql.Query(query, args => {
            args.Add("?id", id);
        });

        if (drc.Count > 0)
        {
            return Sql.MapOne<Klientas>(drc, (dre, t) => {
                t.id_USER = dre.From<int>("id_USER");
                t.email = dre.From<string>("email");
                t.password = dre.From<string>("password");
                t.name = dre.From<string>("name");
                t.surname = dre.From<string>("surname");
                t.phoneNumber = dre.From<string?>("phoneNumber");
                t.address = dre.From<string?>("address");
            });
        }

        return null;
	}

	public static void Insert(Klientas klientas)
	{
		var query = $@"INSERT INTO `{Config.TblPrefix}users`
                      (email, password, name, surname, phoneNumber, address)
                      VALUES(?email, ?password, ?name, ?surname, ?phone, ?address)";

        Sql.Insert(query, args => {
            args.Add("?email", klientas.email);
            args.Add("?password", klientas.password);
            args.Add("?name", klientas.name);
            args.Add("?surname", klientas.surname);
            args.Add("?phone", klientas.phoneNumber ?? (object)DBNull.Value);
            args.Add("?address", klientas.address ?? (object)DBNull.Value);
        });
	}

	public static void Update(Klientas klientas)
	{
		var query = $@"UPDATE `{Config.TblPrefix}users`
                      SET email=?email, password=?password, name=?name,
                          surname=?surname, phoneNumber=?phone, address=?address
                      WHERE id_USER=?id";

		Sql.Update(query, args => {
            args.Add("?id", klientas.id_USER);
            args.Add("?email", klientas.email);
            args.Add("?password", klientas.password);
            args.Add("?name", klientas.name);
            args.Add("?surname", klientas.surname);
            args.Add("?phone", klientas.phoneNumber ?? (object)DBNull.Value);
            args.Add("?address", klientas.address ?? (object)DBNull.Value);
		});
	}

	public static void Delete(string id)
	{
		var query = $@"DELETE FROM `{Config.TblPrefix}users` WHERE id_USER=?id";
        Sql.Delete(query, args => {
            args.Add("?id", id);
        });
	}


    public static void InitializeUsers()
{
    int startId = 10;
    
    for (int i = 0; i < 20; i++)
    {
        var user = new Klientas 
        { 
            email = $"email-{startId + i}",
            password = $"password-{startId + i}",   
            name = $"name-{startId + i}",
            surname = $"surname-{startId + i}",
            phoneNumber = $"phoneNumber-{startId + i}",
            address = $"address-{startId + i}"
        };

        try
        {
            Insert(user);
        }
        catch
        {
            Update(user);
        }
    }
}
}
