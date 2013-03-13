# Arrêts de bus et tram

Les arrêts de la CTS sont identifiés pas leur `code`.

Les attributs que l'API permet de récupérer sont :
- code
- nom
- horaires en temps réel
- fiche d'horaires


## Trouver le code d'un arrêt

Pour l'instant, le seul moyen de trouver un arrêt est de lister tout les arrêts.

    GET http://cts.api.strasbourg-data.fr/stops
<a class="btn" href="http://cts.api.strasbourg-data.fr/stops">tester</a>

#### Réponse
    Status: 200 OK

```json
[
  {
    "code": 10,
    "name": "Abattoirs (HOLTZHEIM)"
  },
  {
    "code": 100,
    "name": "Cité Meinau"
  },
  { … }
]
```

### Détails d'un arrêt

    GET http://cts.api.strasbourg-data.fr/stops/:id
<a class="btn" href="http://cts.api.strasbourg-data.fr/stops/322">tester</a>

#### Réponse
    Status: 200 OK

```json
{
  "code":322,
  "name":"Langstross/Grand Rue",
  "next_arrivals":[
    {
      "mode": "Tram",
      "destination": "A Hautepierre",
      "horaire": "2013-03-06T17:56:02+00:00",
      "est_apres_minuit": false
    },
    { … }
  ],
  "timesheets":[
    {
      "libelle_destination": "Illkirch Lixenbuhl",
      "url": "53/78539.pdf",
      "debut_validite": "2012-09-03T00:00:00+00:00",
      "fin_validite": "2013-06-23T00:00:00+00:00",
      "type_periode": "1",
      "libelle_periode": "Hiver Tram 2012-2013",
      "code_arret": "322A",
      "ligne": "A"
    },
    { … }
  ]
}
```
