﻿using BusinessObject.DTO.Response;

namespace ElectronicAPI.Services
{
    public interface IProductService
    {
        BaseResponse List(int pageNumber = 1, int pageSize = 3, string productName = "", int categoryID = 0);
    }
}