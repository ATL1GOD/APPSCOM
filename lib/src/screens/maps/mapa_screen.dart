import 'package:appscom/src/screens/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
      static const String routeName ='/mapa';
  const MapScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final MapController _mapController;
  LatLng _center = LatLng(19.50474198282711, -99.14679789693706); // Centro predeterminado (Ciudad de México)
  bool _isLoading = true; // Para mostrar un indicador de carga al inicio


  @override
  Widget build(BuildContext context) {
    return MenuGlobal(
      selectedIndex: 1, // Add the required selectedIndex argument
    child:Scaffold(
      appBar: AppBar(
        title: Text('Mapa Atl'),
        backgroundColor: Color.fromARGB(255, 47, 77, 141),
      ),
      body: Stack(
        children: [
            FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _center,
              initialZoom: 17.5,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              CircleLayer(
                circles: [
                  CircleMarker(
                    point: LatLng(19.50474198282711, -99.14679789693706),
                    color: const Color.fromARGB(255, 204, 204, 204).withOpacity(0.3),
                    borderStrokeWidth: 2.0,
                    borderColor: const Color.fromARGB(255, 206, 204, 204),
                    radius: 250.0,
                  ),
                ],
              ),
              PolygonLayer(
                polygons: [
                  Polygon(
                    points: [
                      LatLng(19.50622322469887, -99.14698505234306),
                      LatLng(19.506137263693468, -99.14654248787114),
                      LatLng(19.50590466309683, -99.146512983573),
                      LatLng(19.50535966664943, -99.14534905196001),
                      LatLng(19.505245894113305, -99.1454000139295),
                      LatLng(19.505402647350298, -99.14590158700528),
                      LatLng(19.505806060564048, -99.14684021305867),
                      LatLng(19.503806186054835, -99.14783531258692),
                      LatLng(19.50392208915162, -99.14811113008244),
                      LatLng(19.50622322469887, -99.14698505234306),
                    ],
                    color: const Color.fromARGB(255, 2, 104, 44).withOpacity(0.3),
                    borderStrokeWidth: 2.0,
                    borderColor: const Color.fromARGB(255, 65, 153, 13),
                  ),
                ],
              ),
              PolygonLayer(
                polygons: [
                  Polygon(
                    points: [
                      LatLng(19.505245894113305, -99.1454000139295),
                      LatLng(19.503195446449713, -99.14644607542299),
                      LatLng(19.503412881094143, -99.14692887302873),
                      LatLng(19.505402647350298, -99.14590158700528),
                    ],
                    color: const Color.fromARGB(255, 97, 97, 97).withOpacity(0.3),
                    borderStrokeWidth: 2.0,
                    borderColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
              PolygonLayer(
                polygons: [
                  Polygon(
                    points: [
                      LatLng(19.505402647350298, -99.14590158700528),
                      LatLng(19.505806060564048, -99.14684021305867),
                      LatLng(19.503806186054835, -99.14783531258692),
                      LatLng(19.503412881094143, -99.14692887302873),
                    ],
                    color: const Color.fromARGB(255, 20, 159, 201).withOpacity(0.3),
                    borderStrokeWidth: 2.0,
                    borderColor: const Color.fromARGB(255, 24, 87, 224),
                  ),
                ],
              ),
            
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [
                      LatLng(19.500879156989402, -99.14864106719338), 
                      LatLng(19.500739168313306, -99.14910700184758)
                      ],
                    color: const Color.fromARGB(255, 185, 107, 17),
                    strokeWidth: 5.0,
                  ),
                ],
              ),

              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [
                      LatLng(19.50379591926113, -99.1478435063122), 
                      LatLng(19.50391001716007, -99.14811639649962), 
                      LatLng(19.50241419622492, -99.14889761444242),
                      LatLng(19.50195277647953, -99.14918192859258),
                      LatLng(19.50100212123712, -99.14881178377108),
                      LatLng(19.501052348715362, -99.1486504549246),
                      LatLng(19.500879156989402, -99.14864106719338)
                      ],
                    color: const Color.fromARGB(255, 81, 17, 185),
                    strokeWidth: 5.0,
                  ),
                ],
              ),
              PolygonLayer(
                polygons: [
                  Polygon(
                    points: [
                      LatLng(19.50130876247902, -99.14933523149702), 
                      LatLng(19.50004079448415, -99.14882695290284), 
                      LatLng(19.499956094371814, -99.14907237502473),
                      LatLng(19.50122156196624, -99.14956780952811)
                    ],
                    color: const Color.fromARGB(255, 214, 128, 15).withOpacity(0.3),
                    borderStrokeWidth: 2.0,
                    borderColor: const Color.fromARGB(255, 151, 76, 5),
                  ),
                ],
              ),
              
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(19.503806186054835, -99.14783531258692),
                    width: 40, // Define el ancho del marcador
                    height: 40, // Define la altura del marcador
                    child: Icon(
                      Icons.location_on,
                      color: const Color.fromARGB(255, 214, 29, 15),
                      size: 35,
                  ),
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(19.500879156989402, -99.14864106719338),
                    width: 40, // Define el ancho del marcador
                    height: 40, // Define la altura del marcador
                    child: Icon(
                      Icons.subway,
                      color: const Color.fromARGB(255, 214, 128, 15),
                      size: 35,
                  ),
                  ),
                ],
              ),
            ],
          ),

          if (_isLoading)
            Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 75, 47, 141),
              ),
            ),
        ],
      ),
    ),
    );
  }


@override
  void initState() {
    super.initState();
    _mapController = MapController();
    _setInitialLocation();
  }

  Future<void> _setInitialLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _center = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showSnackBar('Error al obtener la ubicación inicial: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
