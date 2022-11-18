import 'package:local_storage/shared_preferences/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {

  // Bilgilerimi kaydettim
  void saveSettings(Settings settings) async{
    final sharedPreferences = await SharedPreferences.getInstance(); // shared preferences başlatıldı.
    await sharedPreferences.setString('username', settings.userName!); // string verisini shared preferencesa kaydediyorum. Key value şeklinde 
    await sharedPreferences.setBool('isEmployed', settings.isEmployed!); 
    // Kaydedeceğim diğer değerler enum => enum değerler kolaylıkla int olarak tutulabilir. Dizideki index mantığı
    await sharedPreferences.setInt('gender', settings.gender!.index); 
    // programmin language olarak gelecek değerimiz bir liste aynı zamanda enum string listesi kullanacağız
    await sharedPreferences.setStringList('programmingLanguages', settings.programmingLanguages!.map((item) => item.index.toString()).toList());
    print("Save Settings");
  }

  // Kaydettiğim bilgileri dönüyorum
  Future<Settings> getSettings() async{
    final preferences = await SharedPreferences.getInstance(); // shared preferences başlatıldı.
    final getUserName = preferences.getString('username'); // username bilgisi geliyor.
    final getIsEmployed = preferences.getBool('isEmployed'); // username bilgisi geliyor.
    final getGender = Gender.values[preferences.getInt('gender') ?? 0]; // boşsa sıfır dönsün
    final getProgramminLangeagesIndex = preferences.getStringList('programmingLanguages'); // username bilgisi geliyor.   

    final getProgramminLangeages = getProgramminLangeagesIndex!.map((index) => ProgrammingLanguages.values[int.parse(index)]).toSet(); // gelen indexleri tekrardan value ları almış
    // olduğumuz set listesine çeviriyoruz.
    return Settings(userName: getUserName, isEmployed: getIsEmployed, gender: getGender, programmingLanguages: getProgramminLangeages);
  }



}


// settings.programmingLanguages!.map((item) => item.index.toString()).toList()