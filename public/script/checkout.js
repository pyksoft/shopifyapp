if (window.location.href.indexOf('checkout') > -1) {
    window.onload = function() {

        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyA7s-Y8HrzH481F0eT2gndRVwvEbVVx7bg&libraries=places";
        script.async = "true";
        script.defer = "defer";
        document.body.appendChild(script);

        setTimeout(initAutocomplete, 2000);

        //var shipping_address = document.getElementsByClassName("review-block__content")[0];
        var shipping_address = 1;
        if(shopping_address != 1) {
            console.log("shipping_address exists");
        } else {
            console.log("shipping_address does not exist");
        }

        var lookup = {
            "street_number": document.getElementById('checkout_shipping_address_address1'),
            "route": document.getElementById('checkout_shipping_address_address1'),
            "fullAddress": document.getElementById('checkout_shipping_address_address1'),
            "locality": document.getElementById('checkout_shipping_address_city'),
            "neighborhood": document.getElementById('checkout_shipping_address_city'),
            "administrative_area_level_1": document.getElementById('checkout_shipping_address_province'),
            "country": document.getElementById('checkout_shipping_address_country'),
            "postal_code": document.getElementById('checkout_shipping_address_zip')
        };
        var placeSearch;
        var autocomplete;
        var componentForm = {
            street_number: 'short_name',
            route: 'long_name',
            locality: 'long_name',
            administrative_area_level_1: 'long_name',
            country: 'long_name',
            neighborhood: 'long_name',
            postal_code: 'short_name'
        };

        function initAutocomplete() {
            document.getElementById('checkout_shipping_address_address1').onFocus = "geolocate()";

            autocomplete = new google.maps.places.Autocomplete(
                (document.getElementById('checkout_shipping_address_address1')), { types: ['geocode'] });

            autocomplete.addListener('place_changed', fillInAddress);
        }


        function fillInAddress() {
            var place = autocomplete.getPlace();
            for (var component in componentForm) {
                lookup[component].value = '';
            }
            var fullAddress = '';
            for (var i = 0; i < place.address_components.length; i++) {
                var addressType = place.address_components[i].types[0];
                var val = place.address_components[i][componentForm[addressType]];
                if (componentForm[addressType]) {
                    switch (addressType) {
                        case 'street_number':
                            fullAddress = val + fullAddress;
                            break;
                        case 'route':
                            fullAddress = fullAddress + ' ';
                            fullAddress = fullAddress + val;
                            break;
                        case 'neighborhood':
                            lookup.neighborhood.value = val;
                            break;
                        case 'locality':
                            lookup.locality.value = val;
                            break;
                        case 'administrative_area_level_1':
                            lookup.administrative_area_level_1.value = val;
                            break;
                        case 'country':
                            lookup.country.value = val;
                            break;
                        case 'postal_code':
                            lookup.postal_code.value = val;
                            break;
                    }
                }
            }
            lookup.fullAddress.value = fullAddress;
        }

        function geolocate() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var geolocation = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };
                    var circle = new google.maps.Circle({
                        center: geolocation,
                        radius: position.coords.accuracy
                    });
                    autocomplete.setBounds(circle.getBounds());
                });
            }
        }


    };
}