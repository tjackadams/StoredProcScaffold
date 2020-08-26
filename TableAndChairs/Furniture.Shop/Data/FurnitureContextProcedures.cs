﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Threading.Tasks;
using Furniture.Shop.Models;

namespace Furniture.Shop.Data
{
    public partial class FurnitureContextProcedures
    {
        private readonly FurnitureContext _context;

        public FurnitureContextProcedures(FurnitureContext context)
        {
            _context = context;
        }

        public async Task<GetShipmentsResult[]> GetShipments(DataTable Shipments)
        {
            var parameterShipments = new SqlParameter
            {
                ParameterName = "Shipments",
                SqlDbType = System.Data.SqlDbType.Structured,
                Value = Shipments,
            };

            var result = await _context.SqlQuery<GetShipmentsResult>("EXEC [dbo].[GetShipments] @Shipments  ",parameterShipments);

            return result;
        }
    }
}