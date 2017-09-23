using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SalesAppDLL;
using SalesAppDLL.CustomModels;

namespace SalesAppBLL.Repository
{
    public class PlacesRepository : Repository<PlacesDetail>
    {
        public PlaceDetailModel AddPlace(PlacesDetail det)
        {
            try
            {
                //det.Id is userid when adding place
                var check = DbContext.PlacesDetails.Where(i => i.PlaceId == det.PlaceId).FirstOrDefault();

                if (check != null)
                {
                    DbContext.UserAssignedPlaces.Add(new UserAssignedPlace { PlaceId = check.Id, UserId = det.Id });
                    DbContext.SaveChanges();
                    return new PlaceDetailModel
                    {
                        Address = check.Address,
                        Id = check.Id,
                        Country = check.Country,
                        CountryCode = check.CountryCode,
                        IsActive = check.IsActive,
                        Latitude = check.Latitude,
                        Longitude = check.Longitude,
                        Name = check.Name,
                        Note = check.Note,
                        PhotoUrl = check.PhotoUrl,
                        PlaceId = check.PlaceId,
                        PostalCode = check.PostalCode,
                        State = check.State,
                        Tags = check.Tags,
                        Website = check.Website
                    };
                }
                else
                {
                    var userId = det.Id;
                    var data = DbContext.PlacesDetails.Add(det);
                    DbContext.SaveChanges();
                    DbContext.UserAssignedPlaces.Add(new UserAssignedPlace { PlaceId = data.Id, UserId = userId });
                    DbContext.SaveChanges();
                    return new PlaceDetailModel
                    {
                        Address = data.Address,
                        Id = data.Id,
                        Country = data.Country,
                        CountryCode = data.CountryCode,
                        IsActive = data.IsActive,
                        Latitude = data.Latitude,
                        Longitude = data.Longitude,
                        Name = data.Name,
                        Note = data.Note,
                        PhotoUrl = data.PhotoUrl,
                        PlaceId = data.PlaceId,
                        PostalCode = data.PostalCode,
                        State = data.State,
                        Tags = data.Tags,
                        Website = data.Website
                    }; ;
                }
            }
            catch (System.Exception ex)
            {
                return null;
            }
        }

        public List<GetAllPlacesInfo_Result> ShowAllPlaces(int userId)
        {
            try
            {
                var lst = DbContext.GetAllPlacesInfo(userId).ToList();
                return lst;
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public PlacesDetail GetPlaceById(int placeId)
        {
            try
            {
                var detail = DbContext.PlacesDetails.Where(i => i.Id == placeId).FirstOrDefault();
                return detail;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
