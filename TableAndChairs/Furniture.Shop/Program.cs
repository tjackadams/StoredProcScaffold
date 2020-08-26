using System;
using System.Data;
using System.Threading.Tasks;
using Furniture.Shop.Data;
using Microsoft.Extensions.DependencyInjection;

namespace Furniture.Shop
{
    class Program
    {
        static async Task Main(string[] args)
        {
            var services = new ServiceCollection()
                .AddDbContext<FurnitureContext>()
                .AddTransient(sp =>
                    new FurnitureContextProcedures(sp.GetRequiredService<FurnitureContext>()));

            var serviceProvider = services.BuildServiceProvider();

            var proc = serviceProvider.GetRequiredService<FurnitureContextProcedures>();

            var parameter = new DataTable();
            parameter.Columns.Add("Value", typeof(int));
            parameter.Rows.Add(1);

            foreach (var shipment in await proc.GetShipments(parameter))
            {
                Console.WriteLine("Shipment: {0}", System.Text.Json.JsonSerializer.Serialize(shipment));
            }


            Console.ReadLine();
        }
    }
}
