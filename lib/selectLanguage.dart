import 'package:flutter/material.dart';

class SelectLanguage extends StatefulWidget {

  final String fromOrTo;
  SelectLanguage({super.key,required String this.fromOrTo});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {

  TextEditingController languageController=TextEditingController();

  final _langs = {
    'auto': 'Auto Detect Language',
    'af': 'Afrikaans',
    'sq': 'Albanian',
    'am': 'Amharic',
    'ar': 'Arabic',
    'hy': 'Armenian',
    'as': 'Assamese',
    'ay': 'Aymara',
    'az': 'Azerbaijani',
    'bm': 'Bambara',
    'eu': 'Basque',
    'be': 'Belarusian',
    'bn': 'Bengali',
    'bho': 'Bhojpuri',
    'bs': 'Bosnian',
    'bg': 'Bulgarian',
    'ca': 'Catalan',
    'ceb': 'Cebuano',
    'zh-cn': 'Chinese (Simplified)',
    'zh-tw': 'Chinese (Traditional)',
    'co': 'Corsican',
    'hr': 'Croatian',
    'cs': 'Czech',
    'da': 'Danish',
    'dv': 'Dhivehi',
    'doi': 'Dogri',
    'nl': 'Dutch',
    'en': 'English',
    'eo': 'Esperanto',
    'et': 'Estonian',
    'ee': 'Ewe',
    'fil': 'Filipino (Tagalog)',
    'fi': 'Finnish',
    'fr': 'French',
    'fy': 'Frisian',
    'gl': 'Galician',
    'ka': 'Georgian',
    'de': 'German',
    'el': 'Greek',
    'gn': 'Guarani',
    'gu': 'Gujarati',
    'ht': 'Haitian Creole',
    'ha': 'Hausa',
    'haw': 'Hawaiian',
    'he': 'Hebrew',
    'hi': 'Hindi',
    'hmn': 'Hmong',
    'hu': 'Hungarian',
    'is': 'Icelandic',
    'ig': 'Igbo',
    'ilo': 'Ilocano',
    'id': 'Indonesian',
    'ga': 'Irish',
    'it': 'Italian',
    'ja': 'Japanese',
    'jv': 'Javanese',
    'kn': 'Kannada',
    'kk': 'Kazakh',
    'km': 'Khmer',
    'rw': 'Kinyarwanda',
    'gom': 'Konkani',
    'ko': 'Korean',
    'kri': 'Krio',
    'ku': 'Kurdish (Kurmanji)',
    'ckb': 'Kurdish (Sorani)',
    'ky': 'Kyrgyz',
    'lo': 'Lao',
    'la': 'Latin',
    'lv': 'Latvian',
    'ln': 'Lingala',
    'lt': 'Lithuanian',
    'lg': 'Luganda',
    'lb': 'Luxembourgish',
    'mk': 'Macedonian',
    'mai': 'Maithili',
    'mg': 'Malagasy',
    'ms': 'Malay',
    'ml': 'Malayalam',
    'mt': 'Maltese',
    'mi': 'Maori',
    'mr': 'Marathi',
    'mni-mtei': 'Meiteilon (Manipuri)',
    'lus': 'Mizo',
    'mn': 'Mongolian',
    'my': 'Myanmar (Burmese)',
    'ne': 'Nepali',
    'no': 'Norwegian',
    'ny': 'Nyanja (Chichewa)',
    'or': 'Odia (Oriya)',
    'om': 'Oromo',
    'ps': 'Pashto',
    'fa': 'Persian',
    'pl': 'Polish',
    'pt': 'Portuguese',
    'pa': 'Punjabi',
    'qu': 'Quechua',
    'ro': 'Romanian',
    'ru': 'Russian',
    'sm': 'Samoan',
    'sa': 'Sanskrit',
    'gd': 'Scots Gaelic',
    'nso': 'Sepedi',
    'sr': 'Serbian',
    'st': 'Sesotho',
    'sn': 'Shona',
    'sd': 'Sindhi',
    'si': 'Sinhala',
    'sk': 'Slovak',
    'sl': 'Slovenian',
    'so': 'Somali',
    'es': 'Spanish',
    'su': 'Sundanese',
    'sw': 'Swahili',
    'sv': 'Swedish',
    'tl': 'Tagalog (Filipino)',
    'tg': 'Tajik',
    'ta': 'Tamil',
    'tt': 'Tatar',
    'te': 'Telugu',
    'th': 'Thai',
    'ti': 'Tigrinya',
    'ts': 'Tsonga',
    'tr': 'Turkish',
    'tk': 'Turkmen',
    'ak': 'Twi (Akan)',
    'uk': 'Ukrainian',
    'ur': 'Urdu',
    'ug': 'Uyghur',
    'uz': 'Uzbek',
    'vi': 'Vietnamese',
    'cy': 'Welsh',
    'xh': 'Xhosa',
    'yi': 'Yiddish',
    'yo': 'Yoruba',
    'zu': 'Zulu',
  };

  @override
  void initState() {
    super.initState();
    // Initialize with the full list of languages
    if(widget.fromOrTo=="to"){
      _langs.remove("auto");
    }
    _filteredLangs = _langs.entries.toList();
  }

  List<MapEntry<String, String>> _filteredLangs = [];
  String _searchTerm = '';

  void _filterLanguages(String searchTerm) {
    setState(() {
      _searchTerm = searchTerm.toLowerCase();
      _filteredLangs = _langs.entries
          .where((entry) => entry.value.toLowerCase().contains(_searchTerm))
          .toList();
    });
  }


  @override
  Widget build(BuildContext context) {

    // Get the list of language names (the map values)
    List<String> languageNames = _langs.values.toList();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          //Color remains white while scrolling
          surfaceTintColor: Colors.white,
          title: Text("Select Language"),
        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height:50,
                child: TextField(
                  controller: languageController,
                  cursorColor: Color.fromRGBO(1,102,255,1),
                  onChanged: (value) {
                    _filterLanguages(value);
                  },
                  decoration: InputDecoration(
                      fillColor: Color.fromRGBO(243,244,246,1,),
                      filled:true,
                      hintText: "Search languages...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded border
                        borderSide: BorderSide(color: Colors.transparent), // No border by default
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded border
                        borderSide: BorderSide(color: Colors.white, width: 2), // Blue border when enabled
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded border
                        borderSide: BorderSide(color:Color.fromRGBO(1,102,255,1), width: 2),
                      ),
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(left:10,right:10)
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: _filteredLangs.length,
                  itemBuilder: (context, index) {
                    final langEntry = _filteredLangs[index];
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).pop([langEntry.key.toString(),langEntry.value.toString()]);
                      },
                      child: ListTile(
                        title: Text(langEntry.value),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        )
    );
  }
}
