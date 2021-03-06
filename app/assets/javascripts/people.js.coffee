# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->  
  $('.person').click () ->
    window.location.href = $(this).data('url')
      
  $('#region_select').change () ->
    changeZoneValues()
  
  $('.star_auspices').each (idx, el) ->
    $(el).dialog
      autoOpen: false
  $('#chart_tab a').click (e) ->
    e.preventDefault()
    $(this).tab 'show'
    
  $('#palace_tabs a').click (e) ->
    e.preventDefault()
    $(this).tab 'show'
  
  $('.tooltippy').tooltip()
  $('#region_select').typeahead
    source: regions
    minLength: 0
  $('#zone_select').typeahead
    source: () ->
      zones[$('#region_select').val()]
    minLength: 0
    
  $('#person_year').typeahead
    source: () ->
      _.map [1900..2099], (i) -> i.toString()
  
  $('#person_yin_yang').tooltip
    title: 'Yin / Yang of this person.  Generally corresponds to their gender.'

  # $('#person_year').focusout () ->
  #   val = $(this).val()
  #   if !isNaN(val) and parseInt(val) >= 1970
  #     $('#timezone_select').show()
  #   else
  #     $('#timezone_select').hide()      
  
  $('.chart .palace').click () ->
    $('#palace_selector a[href=#' + $(this).data('palace') + ']').tab('show')
    # $('.modal.' + $(this).data('palace')).modal('toggle')
  
  # $('[data-provide=typeahead]').attr('autocomplete', 'off')
  
  
  $(document).on 'click', '.show_all_relationship_data', (e) ->
    e.preventDefault()
    $(this).parent().parent().find('.collapse').collapse('show')

  $(document).on 'click', '.collapse_all_relationship_data', (e) ->
    e.preventDefault()
    $(this).parent().parent().find('.collapse').collapse('hide')
  
  bloodhound = new Bloodhound
    name: 'foobax'
    remote: 
      url: '/charts.json?term=%QUERY'
    datumTokenizer: (d) ->
      name: Bloodhound.tokenizers.whitespace d.name
      value: d.value
      
    queryTokenizer: Bloodhound.tokenizers.whitespace
    
  bloodhound.initialize()

  $('#people_search').typeahead
    autoselect: true
    highlight: true
  ,
    name: 'search_data'
    source: bloodhound.ttAdapter()
    displayKey: 'name'

  $(document).on 'typeahead:selected', '#people_search', (e, object, data) ->
    window.location.href = object.value
    # console.log object
  
  _.each regions, (item) ->
    $('#region_select').append '<option value="' + item + '">' + item + '</option>'
    
  changeZoneValues()
  
changeZoneValues = () ->
  $('#zone_select option').remove()
  _.each zones[$('#region_select').val()], (item) ->
    $('#zone_select').append '<option value="' + item + '">' + item + '</option>'  
  
regions = ["US", "Africa", "America", "Antarctica", "Arctic", "Asia", "Atlantic", "Australia", "Brazil", "Canada", "Chile", "Etc.", "Europe", "Indian", "Mexico", "Pacific"]
zones =
  Africa: ["Abidjan", "Accra", "Addis_Ababa", "Algiers", "Asmara", "Asmera", "Bamako", "Bangui", "Banjul", "Bissau", "Blantyre", "Brazzaville", "Bujumbura", "Cairo", "Casablanca", "Ceuta", "Conakry", "Dakar", "Dar_es_Salaam", "Djibouti", "Douala", "El_Aaiun", "Freetown", "Gaborone", "Harare", "Johannesburg", "Juba", "Kampala", "Khartoum", "Kigali", "Kinshasa", "Lagos", "Libreville", "Lome", "Luanda", "Lubumbashi", "Lusaka", "Malabo", "Maputo", "Maseru", "Mbabane", "Mogadishu", "Monrovia", "Nairobi", "Ndjamena", "Niamey", "Nouakchott", "Ouagadougou", "Porto-Novo", "Sao_Tome", "Timbuktu", "Tripoli", "Tunis", "Windhoek"]
  America: ["Adak", "Anchorage", "Anguilla", "Antigua", "Araguaina", "Argentina/Buenos_Aires", "Argentina/Catamarca", "Argentina/ComodRivadavia", "Argentina/Cordoba", "Argentina/Jujuy", "Argentina/La_Rioja", "Argentina/Mendoza", "Argentina/Rio_Gallegos", "Argentina/Salta", "Argentina/San_Juan", "Argentina/San_Luis", "Argentina/Tucuman", "Argentina/Ushuaia", "Aruba", "Asuncion", "Atikokan", "Atka", "Bahia", "Bahia_Banderas", "Barbados", "Belem", "Belize", "Blanc-Sablon", "Boa_Vista", "Bogota", "Boise", "Buenos_Aires", "Cambridge_Bay", "Campo_Grande", "Cancun", "Caracas", "Catamarca", "Cayenne", "Cayman", "Chicago", "Chihuahua", "Coral_Harbour", "Cordoba", "Costa_Rica", "Creston", "Cuiaba", "Curacao", "Danmarkshavn", "Dawson", "Dawson_Creek", "Denver", "Detroit", "Dominica", "Edmonton", "Eirunepe", "El_Salvador", "Ensenada", "Fort_Wayne", "Fortaleza", "Glace_Bay", "Godthab", "Goose_Bay", "Grand_Turk", "Grenada", "Guadeloupe", "Guatemala", "Guayaquil", "Guyana", "Halifax", "Havana", "Hermosillo", "Indiana/Indianapolis", "Indiana/Knox", "Indiana/Marengo", "Indiana/Petersburg", "Indiana/Tell_City", "Indiana/Vevay", "Indiana/Vincennes", "Indiana/Winamac", "Indianapolis", "Inuvik", "Iqaluit", "Jamaica", "Jujuy", "Juneau", "Kentucky/Louisville", "Kentucky/Monticello", "Knox_IN", "Kralendijk", "La_Paz", "Lima", "Los_Angeles", "Louisville", "Lower_Princes", "Maceio", "Managua", "Manaus", "Marigot", "Martinique", "Matamoros", "Mazatlan", "Mendoza", "Menominee", "Merida", "Metlakatla", "Mexico_City", "Miquelon", "Moncton", "Monterrey", "Montevideo", "Montreal", "Montserrat", "Nassau", "New_York", "Nipigon", "Nome", "Noronha", "North_Dakota/Beulah", "North_Dakota/Center", "North_Dakota/New_Salem", "Ojinaga", "Panama", "Pangnirtung", "Paramaribo", "Phoenix", "Port-au-Prince", "Port_of_Spain", "Porto_Acre", "Porto_Velho", "Puerto_Rico", "Rainy_River", "Rankin_Inlet", "Recife", "Regina", "Resolute", "Rio_Branco", "Rosario", "Santa_Isabel", "Santarem", "Santiago", "Santo_Domingo", "Sao_Paulo", "Scoresbysund", "Shiprock", "Sitka", "St_Barthelemy", "St_Johns", "St_Kitts", "St_Lucia", "St_Thomas", "St_Vincent", "Swift_Current", "Tegucigalpa", "Thule", "Thunder_Bay", "Tijuana", "Toronto", "Tortola", "Vancouver", "Virgin", "Whitehorse", "Winnipeg", "Yakutat", "Yellowknife"]
  Antarctica: ["Casey", "Davis", "DumontDUrville", "Macquarie", "Mawson", "McMurdo", "Palmer", "Rothera", "South_Pole", "Syowa", "Vostok"]
  Arctic: ["Longyearbyen"]
  Asia: ["Aden", "Almaty", "Amman", "Anadyr", "Aqtau", "Aqtobe", "Ashgabat", "Ashkhabad", "Baghdad", "Bahrain", "Baku", "Bangkok", "Beirut", "Bishkek", "Brunei", "Calcutta", "Choibalsan", "Chongqing", "Chungking", "Colombo", "Dacca", "Damascus", "Dhaka", "Dili", "Dubai", "Dushanbe", "Gaza", "Harbin", "Hebron", "Ho_Chi_Minh", "Hong_Kong", "Hovd", "Irkutsk", "Istanbul", "Jakarta", "Jayapura", "Jerusalem", "Kabul", "Kamchatka", "Karachi", "Kashgar", "Kathmandu", "Katmandu", "Kolkata", "Krasnoyarsk", "Kuala_Lumpur", "Kuching", "Kuwait", "Macao", "Macau", "Magadan", "Makassar", "Manila", "Muscat", "Nicosia", "Novokuznetsk", "Novosibirsk", "Omsk", "Oral", "Phnom_Penh", "Pontianak", "Pyongyang", "Qatar", "Qyzylorda", "Rangoon", "Riyadh", "Saigon", "Sakhalin", "Samarkand", "Seoul", "Shanghai", "Singapore", "Taipei", "Tashkent", "Tbilisi", "Tehran", "Tel_Aviv", "Thimbu", "Thimphu", "Tokyo", "Ujung_Pandang", "Ulaanbaatar", "Ulan_Bator", "Urumqi", "Vientiane", "Vladivostok", "Yakutsk", "Yekaterinburg", "Yerevan"]
  Atlantic: ["Azores", "Bermuda", "Canary", "Cape_Verde", "Faeroe", "Faroe", "Jan_Mayen", "Madeira", "Reykjavik", "South_Georgia", "St_Helena", "Stanley"]
  Australia: ["ACT", "Adelaide", "Brisbane", "Broken_Hill", "Canberra", "Currie", "Darwin", "Eucla", "Hobart", "LHI", "Lindeman", "Lord_Howe", "Melbourne", "North", "NSW", "Perth", "Queensland", "South", "Sydney", "Tasmania", "Victoria", "West", "Yancowinna"]
  Brazil: ["Acre", "DeNoronha", "East", "West"]
  Canada: ["Atlantic", "Central", "East-Saskatchewan", "Eastern", "Mountain", "Newfoundland", "Pacific", "Saskatchewan", "Yukon"]
  Chile: ["Continental", "EasterIsland"]
  "Etc.": ["GMT", "GMT+0", "UCT", "Universal", "UTC", "Zulu"]
  Europe: ["Amsterdam", "Andorra", "Athens", "Belfast", "Belgrade", "Berlin", "Bratislava", "Brussels", "Bucharest", "Budapest", "Chisinau", "Copenhagen", "Dublin", "Gibraltar", "Guernsey", "Helsinki", "Isle_of_Man", "Istanbul", "Jersey", "Kaliningrad", "Kiev", "Lisbon", "Ljubljana", "London", "Luxembourg", "Madrid", "Malta", "Mariehamn", "Minsk", "Monaco", "Moscow", "Nicosia", "Oslo", "Paris", "Podgorica", "Prague", "Riga", "Rome", "Samara", "San_Marino", "Sarajevo", "Simferopol", "Skopje", "Sofia", "Stockholm", "Tallinn", "Tirane", "Tiraspol", "Uzhgorod", "Vaduz", "Vatican", "Vienna", "Vilnius", "Volgograd", "Warsaw", "Zagreb", "Zaporozhye", "Zurich"]
  Indian: ["Antananarivo", "Chagos", "Christmas", "Cocos", "Comoro", "Kerguelen", "Mahe", "Maldives", "Mauritius", "Mayotte", "Reunion"]
  Mexico: ["BajaNorte", "BajaSur", "General"]
  Pacific: ["Apia", "Auckland", "Chatham", "Chuuk", "Easter", "Efate", "Enderbury", "Fakaofo", "Fiji", "Funafuti", "Galapagos", "Gambier", "Guadalcanal", "Guam", "Honolulu", "Johnston", "Kiritimati", "Kosrae", "Kwajalein", "Majuro", "Marquesas", "Midway", "Nauru", "Niue", "Norfolk", "Noumea", "Pago_Pago", "Palau", "Pitcairn", "Pohnpei", "Ponape", "Port_Moresby", "Rarotonga", "Saipan", "Samoa", "Tahiti", "Tarawa", "Tongatapu", "Truk", "Wake", "Wallis", "Yap"]
  US: ["Alaska", "Aleutian", "Arizona", "Central", "East-Indiana", "Eastern", "Hawaii", "Indiana-Starke", "Michigan", "Mountain", "Pacific", "Pacific-New", "Samoa"]