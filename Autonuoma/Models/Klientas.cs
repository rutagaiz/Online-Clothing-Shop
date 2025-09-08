namespace Org.Ktu.Isk.P175B602.Autonuoma.Models;

using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;

#nullable enable

/// <summary>
/// Model of 'Klientas' entity.
/// </summary>
public class Klientas
{
	[Display(Name = "ID")]
    public int id_USER { get; set; }

    [Display(Name = "El. paštas")]
    [EmailAddress]
    [Required]
    public string email { get; set; }

    [Display(Name = "Slaptažodis")]
    [DataType(DataType.Password)]
    [Required]
    public string password { get; set; }

    [Display(Name = "Vardas")]
    [Required]
    public string name { get; set; }

    [Display(Name = "Pavardė")]
    [Required]
    public string surname { get; set; }

    [Display(Name = "Telefonas")]
    [Phone]
    public string? phoneNumber { get; set; }

    [Display(Name = "Adresas")]
    public string? address { get; set; }


    public Klientas()
        {
            email = string.Empty;  // Assign empty string to non-nullable email
            password = string.Empty;  // Assign empty string to non-nullable password
            name = string.Empty;  // Assign empty string to non-nullable name
            surname = string.Empty;  // Assign empty string to non-nullable surname
        }
}
