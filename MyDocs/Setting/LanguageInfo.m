//
//  LanguageInfo.m
//  Hanpass
//
//  Created by 김학철 on 2020/02/06.
//  Copyright © 2020 hanpass. All rights reserved.
//

#import "LanguageInfo.h"

@implementation LanguageInfo

- (instancetype)initWithCountryCode:(NSString *)countryCode {
    if (self = [super init]) {
        self.countryCode = countryCode;
        [self setLanguageInfoFromCountryCode];
    }
    return self;
}

- (void)setLanguageInfoFromCountryCode {
    if ([_countryCode isEqualToString:@"KR"]) { //한국
        self.languageName = @"한국어";
        self.languageCode = @"ko";
        self.localizeTblName = @"ko";
        self.localIdentifier = @"ko_KR";
    }
    else if ([_countryCode isEqualToString:@"US"]) { //미국
        self.languageName = @"English";
        self.languageCode = @"en";
        self.localizeTblName = @"en";
        self.localIdentifier = @"en_US";
    }
    else if ([_countryCode isEqualToString:@"ID"]) { //인도네시아
        self.languageName = @"Bahasa Indonesia";
        self.languageCode = @"in";
        self.localizeTblName = @"id-ID";
        self.localIdentifier = @"id_ID";
    }
    else if ([_countryCode isEqualToString:@"PH"]) { //필리핀
        self.languageName = @"Tagalog";
        self.languageCode = @"fil";
        self.localizeTblName = @"fil-PH";
        self.localIdentifier = @"fil_PH";
    }
    else if ([_countryCode isEqualToString:@"KH"]) {  //캄보디아
        self.languageName = @"ភាសាខ្មែរ";
        self.languageCode = @"km";
        self.localizeTblName = @"km";
        self.localIdentifier = @"km_KH";
    }
    else if ([_countryCode isEqualToString:@"NP"]) { //네팔
        self.languageName = @"नेपाली";
        self.languageCode = @"ne";
        self.localizeTblName = @"ne-NP";
        self.localIdentifier = @"ne_NP";
    }
    else if ([_countryCode isEqualToString:@"VN"]) {  //베트남 Vietnam
        self.languageName = @"Người việt nam";
        self.languageCode = @"vi";
        self.localizeTblName = @"vi";
        self.localIdentifier = @"vi_VN";
    }
    else if ([_countryCode isEqualToString:@"CN"]) { //중국
        self.languageName = @"中国语";
        self.languageCode = @"zh";
        self.localizeTblName = @"zh-Hans";
        self.localIdentifier = @"zh_Hans";
    }
    else if ([_countryCode isEqualToString:@"LK"]) { //Sri Lanka
        self.languageName = @"සිංහල";
        self.languageCode = @"si";
        self.localizeTblName = @"si-LK";
        self.localIdentifier = @"si_LK";
    }
    else if ([_countryCode isEqualToString:@"UZ"]) { //uzbek
        self.languageName = @"Oʻzbekiston";
        self.languageCode = @"uz";
        self.localizeTblName = @"uz-UZ";
        self.localIdentifier = @"uz";
    }
    else if ([_countryCode isEqualToString:@"TH"]) { //thailand
        self.languageName = @"ไทย";
        self.languageCode = @"th";
        self.localizeTblName = @"th-TH";
        self.localIdentifier = @"th_TH";
    }
    else if ([_countryCode isEqualToString:@"MM"]) { //Myanmar - Burma
        self.languageName = @"မြန်မာဘာသာ";
        self.languageCode = @"my";
        self.localizeTblName = @"my-MM";
        self.localIdentifier = @"my_MM";
    }
    else if ([_countryCode isEqualToString:@"PK"]) { //Pakistan
        self.languageName = @"Pakistan";
        self.languageCode = @"pk";
        self.localizeTblName = @"ur-PK";
        self.localIdentifier = @"ur_PK";
    }
    else if ([_countryCode isEqualToString:@"RU"]) { //Russia
        self.languageName = @"русский";
        self.languageCode = @"ru";
        self.localizeTblName = @"ru";
        self.localIdentifier = @"ru";
    }
    else if ([_countryCode isEqualToString:@"MN"]) { //Mongolian
        self.languageName = @"Монгол хэл";
        self.languageCode = @"mn";
        self.localizeTblName = @"mn";
        self.localIdentifier = @"mn";
    }
    else if ([_countryCode isEqualToString:@"BD"]) { //Bangladesh
        self.languageName = @"Bangladesh";
        self.languageCode = @"bn";
        self.localizeTblName = @"bn-BD";
        self.localIdentifier = @"bn_BD";
    }
    else {
        self.languageName = @"English";
        self.languageCode = @"en";
        self.localizeTblName = @"en";
        self.localIdentifier = @"en_US";
    }
}

- (NSString *)description {
    NSMutableString *des = [NSMutableString string];
    [des appendFormat:@"countryCode : %@\r", _countryCode];
    [des appendFormat:@"languageName : %@\r", _languageName];
    [des appendFormat:@"languageCode : %@\r", _languageCode];
    [des appendFormat:@"localizeTblName : %@\r", _localizeTblName];
    [des appendFormat:@"localIdentifier : %@\r", _localIdentifier];
    return des;
}

//mr    Marathi
//bs    Bosnian
//ee_TG    Ewe (Togo)
//ms    Malay
//kam_KE    Kamba (Kenya)
//mt    Maltese
//ha    Hausa
//es_HN    Spanish (Honduras)
//ml_IN    Malayalam (India)
//ro_MD    Romanian (Moldova)
//kab_DZ    Kabyle (Algeria)
//he    Hebrew
//es_CO    Spanish (Colombia)
//my    Burmese
//es_PA    Spanish (Panama)
//az_Latn    Azerbaijani (Latin)
//mer    Meru
//en_NZ    English (New Zealand)
//xog_UG    Soga (Uganda)
//sg    Sango
//fr_GP    French (Guadeloupe)
//sr_Cyrl_BA    Serbian (Cyrillic, Bosnia and Herzegovina)
//hi    Hindi
//fil_PH    Filipino (Philippines)
//lt_LT    Lithuanian (Lithuania)
//si    Sinhala
//en_MT    English (Malta)
//si_LK    Sinhala (Sri Lanka)
//luo_KE    Luo (Kenya)
//it_CH    Italian (Switzerland)
//teo    Teso
//mfe    Morisyen
//sk    Slovak
//uz_Cyrl_UZ    Uzbek (Cyrillic, Uzbekistan)
//sl    Slovenian
//rm_CH    Romansh (Switzerland)
//az_Cyrl_AZ    Azerbaijani (Cyrillic, Azerbaijan)
//fr_GQ    French (Equatorial Guinea)
//kde    Makonde
//sn    Shona
//cgg_UG    Chiga (Uganda)
//so    Somali
//fr_RW    French (Rwanda)
//es_SV    Spanish (El Salvador)
//mas_TZ    Masai (Tanzania)
//en_MU    English (Mauritius)
//sq    Albanian
//hr    Croatian
//sr    Serbian
//en_PH    English (Philippines)
//ca    Catalan
//hu    Hungarian
//mk_MK    Macedonian (Macedonia)
//fr_TD    French (Chad)
//nb    Norwegian Bokmål
//sv    Swedish
//kln_KE    Kalenjin (Kenya)
//sw    Swahili
//nd    North Ndebele
//sr_Latn    Serbian (Latin)
//el_GR    Greek (Greece)
//hy    Armenian
//ne    Nepali
//el_CY    Greek (Cyprus)
//es_CR    Spanish (Costa Rica)
//fo_FO    Faroese (Faroe Islands)
//pa_Arab_PK    Punjabi (Arabic, Pakistan)
//seh    Sena
//ar_YE    Arabic (Yemen)
//ja_JP    Japanese (Japan)
//ur_PK    Urdu (Pakistan)
//pa_Guru    Punjabi (Gurmukhi)
//gl_ES    Galician (Spain)
//zh_Hant_HK    Chinese (Traditional Han, Hong Kong SAR China)
//ar_EG    Arabic (Egypt)
//nl    Dutch
//th_TH    Thai (Thailand)
//es_PE    Spanish (Peru)
//fr_KM    French (Comoros)
//nn    Norwegian Nynorsk
//kk_Cyrl_KZ    Kazakh (Cyrillic, Kazakhstan)
//kea    Kabuverdianu
//lv_LV    Latvian (Latvia)
//kln    Kalenjin
//tzm_Latn    Central Morocco Tamazight (Latin)
//yo    Yoruba
//gsw_CH    Swiss German (Switzerland)
//ha_Latn_GH    Hausa (Latin, Ghana)
//is_IS    Icelandic (Iceland)
//pt_BR    Portuguese (Brazil)
//cs    Czech
//en_PK    English (Pakistan)
//fa_IR    Persian (Iran)
//zh_Hans_SG    Chinese (Simplified Han, Singapore)
//luo    Luo
//ta    Tamil
//fr_TG    French (Togo)
//kde_TZ    Makonde (Tanzania)
//mr_IN    Marathi (India)
//ar_SA    Arabic (Saudi Arabia)
//ka_GE    Georgian (Georgia)
//mfe_MU    Morisyen (Mauritius)
//id    Indonesian
//fr_LU    French (Luxembourg)
//de_LU    German (Luxembourg)
//ru_MD    Russian (Moldova)
//cy    Welsh
//zh_Hans_HK    Chinese (Simplified Han, Hong Kong SAR China)
//te    Telugu
//bg_BG    Bulgarian (Bulgaria)
//shi_Latn    Tachelhit (Latin)
//ig    Igbo
//ses    Koyraboro Senni
//ii    Sichuan Yi
//es_BO    Spanish (Bolivia)
//th    Thai
//ko_KR    Korean (South Korea)
//ti    Tigrinya
//it_IT    Italian (Italy)
//shi_Latn_MA    Tachelhit (Latin, Morocco)
//pt_MZ    Portuguese (Mozambique)
//ff_SN    Fulah (Senegal)
//haw    Hawaiian
//zh_Hans    Chinese (Simplified Han)
//so_KE    Somali (Kenya)
//bn_IN    Bengali (India)
//en_UM    English (U.S. Minor Outlying Islands)
//to    Tonga
//id_ID    Indonesian (Indonesia)
//uz_Cyrl    Uzbek (Cyrillic)
//en_GU    English (Guam)
//es_EC    Spanish (Ecuador)
//en_US_POSIX    English (United States, Computer)
//sr_Latn_BA    Serbian (Latin, Bosnia and Herzegovina)
//is    Icelandic
//luy    Luyia
//tr    Turkish
//en_NA    English (Namibia)
//it    Italian
//da    Danish
//bo_IN    Tibetan (India)
//vun_TZ    Vunjo (Tanzania)
//ar_SD    Arabic (Sudan)
//uz_Latn_UZ    Uzbek (Latin, Uzbekistan)
//az_Latn_AZ    Azerbaijani (Latin, Azerbaijan)
//de    German
//es_GQ    Spanish (Equatorial Guinea)
//ta_IN    Tamil (India)
//de_DE    German (Germany)
//fr_FR    French (France)
//rof_TZ    Rombo (Tanzania)
//ar_LY    Arabic (Libya)
//en_BW    English (Botswana)
//asa    Asu
//zh    Chinese
//ha_Latn    Hausa (Latin)
//fr_NE    French (Niger)
//es_MX    Spanish (Mexico)
//bem_ZM    Bemba (Zambia)
//zh_Hans_CN    Chinese (Simplified Han, China)
//bn_BD    Bengali (Bangladesh)
//pt_GW    Portuguese (Guinea-Bissau)
//om    Oromo
//jmc    Machame
//de_AT    German (Austria)
//kk_Cyrl    Kazakh (Cyrillic)
//sw_TZ    Swahili (Tanzania)
//ar_OM    Arabic (Oman)
//et_EE    Estonian (Estonia)
//or    Oriya
//da_DK    Danish (Denmark)
//ro_RO    Romanian (Romania)
//zh_Hant    Chinese (Traditional Han)
//bm_ML    Bambara (Mali)
//ja    Japanese
//fr_CA    French (Canada)
//naq    Nama
//zu    Zulu
//en_IE    English (Ireland)
//ar_MA    Arabic (Morocco)
//es_GT    Spanish (Guatemala)
//uz_Arab_AF    Uzbek (Arabic, Afghanistan)
//en_AS    English (American Samoa)
//bs_BA    Bosnian (Bosnia and Herzegovina)
//am_ET    Amharic (Ethiopia)
//ar_TN    Arabic (Tunisia)
//haw_US    Hawaiian (United States)
//ar_JO    Arabic (Jordan)
//fa_AF    Persian (Afghanistan)
//uz_Latn    Uzbek (Latin)
//en_BZ    English (Belize)
//nyn_UG    Nyankole (Uganda)
//ebu_KE    Embu (Kenya)
//te_IN    Telugu (India)
//cy_GB    Welsh (United Kingdom)
//uk    Ukrainian
//nyn    Nyankole
//en_JM    English (Jamaica)
//en_US    English (United States)
//fil    Filipino
//ar_KW    Arabic (Kuwait)
//af_ZA    Afrikaans (South Africa)
//en_CA    English (Canada)
//fr_DJ    French (Djibouti)
//ti_ER    Tigrinya (Eritrea)
//ig_NG    Igbo (Nigeria)
//en_AU    English (Australia)
//ur    Urdu
//fr_MC    French (Monaco)
//pt_PT    Portuguese (Portugal)
//pa    Punjabi
//es_419    Spanish (Latin America)
//fr_CD    French (Congo - Kinshasa)
//en_SG    English (Singapore)
//bo_CN    Tibetan (China)
//kn_IN    Kannada (India)
//sr_Cyrl_RS    Serbian (Cyrillic, Serbia)
//lg_UG    Ganda (Uganda)
//gu_IN    Gujarati (India)
//ee    Ewe
//nd_ZW    North Ndebele (Zimbabwe)
//bem    Bemba
//uz    Uzbek
//sw_KE    Swahili (Kenya)
//sq_AL    Albanian (Albania)
//hr_HR    Croatian (Croatia)
//mas_KE    Masai (Kenya)
//el    Greek
//ti_ET    Tigrinya (Ethiopia)
//es_AR    Spanish (Argentina)
//pl    Polish
//en    English
//eo    Esperanto
//shi    Tachelhit
//kok    Konkani
//fr_CF    French (Central African Republic)
//fr_RE    French (Réunion)
//mas    Masai
//rof    Rombo
//ru_UA    Russian (Ukraine)
//yo_NG    Yoruba (Nigeria)
//dav_KE    Taita (Kenya)
//gv_GB    Manx (United Kingdom)
//pa_Arab    Punjabi (Arabic)
//es    Spanish
//teo_UG    Teso (Uganda)
//ps    Pashto
//es_PR    Spanish (Puerto Rico)
//fr_MF    French (Saint Martin)
//et    Estonian
//pt    Portuguese
//eu    Basque
//ka    Georgian
//rwk_TZ    Rwa (Tanzania)
//nb_NO    Norwegian Bokmål (Norway)
//fr_CG    French (Congo - Brazzaville)
//cgg    Chiga
//zh_Hant_TW    Chinese (Traditional Han, Taiwan)
//sr_Cyrl_ME    Serbian (Cyrillic, Montenegro)
//lag    Langi
//ses_ML    Koyraboro Senni (Mali)
//en_ZW    English (Zimbabwe)
//ak_GH    Akan (Ghana)
//vi_VN    Vietnamese (Vietnam)
//sv_FI    Swedish (Finland)
//to_TO    Tonga (Tonga)
//fr_MG    French (Madagascar)
//fr_GA    French (Gabon)
//fr_CH    French (Switzerland)
//de_CH    German (Switzerland)
//es_US    Spanish (United States)
//ki    Kikuyu
//my_MM    Burmese (Myanmar [Burma])
//vi    Vietnamese
//ar_QA    Arabic (Qatar)
//ga_IE    Irish (Ireland)
//rwk    Rwa
//bez    Bena
//ee_GH    Ewe (Ghana)
//kk    Kazakh
//as_IN    Assamese (India)
//ca_ES    Catalan (Spain)
//kl    Kalaallisut
//fr_SN    French (Senegal)
//ne_IN    Nepali (India)
//km    Khmer
//ms_BN    Malay (Brunei)
//ar_LB    Arabic (Lebanon)
//ta_LK    Tamil (Sri Lanka)
//kn    Kannada
//ur_IN    Urdu (India)
//fr_CI    French (Côte d’Ivoire)
//ko    Korean
//ha_Latn_NG    Hausa (Latin, Nigeria)
//sg_CF    Sango (Central African Republic)
//om_ET    Oromo (Ethiopia)
//zh_Hant_MO    Chinese (Traditional Han, Macau SAR China)
//uk_UA    Ukrainian (Ukraine)
//fa    Persian
//mt_MT    Maltese (Malta)
//ki_KE    Kikuyu (Kenya)
//luy_KE    Luyia (Kenya)
//kw    Cornish
//pa_Guru_IN    Punjabi (Gurmukhi, India)
//en_IN    English (India)
//kab    Kabyle
//ar_IQ    Arabic (Iraq)
//ff    Fulah
//en_TT    English (Trinidad and Tobago)
//bez_TZ    Bena (Tanzania)
//es_NI    Spanish (Nicaragua)
//uz_Arab    Uzbek (Arabic)
//ne_NP    Nepali (Nepal)
//fi    Finnish
//khq    Koyra Chiini
//gsw    Swiss German
//zh_Hans_MO    Chinese (Simplified Han, Macau SAR China)
//en_MH    English (Marshall Islands)
//hu_HU    Hungarian (Hungary)
//en_GB    English (United Kingdom)
//fr_BE    French (Belgium)
//de_BE    German (Belgium)
//saq    Samburu
//be_BY    Belarusian (Belarus)
//sl_SI    Slovenian (Slovenia)
//sr_Latn_RS    Serbian (Latin, Serbia)
//fo    Faroese
//fr    French
//xog    Soga
//fr_BF    French (Burkina Faso)
//tzm    Central Morocco Tamazight
//sk_SK    Slovak (Slovakia)
//fr_ML    French (Mali)
//he_IL    Hebrew (Israel)
//ha_Latn_NE    Hausa (Latin, Niger)
//ru_RU    Russian (Russia)
//fr_CM    French (Cameroon)
//teo_KE    Teso (Kenya)
//seh_MZ    Sena (Mozambique)
//kl_GL    Kalaallisut (Greenland)
//fi_FI    Finnish (Finland)
//kam    Kamba
//es_ES    Spanish (Spain)
//af    Afrikaans
//asa_TZ    Asu (Tanzania)
//cs_CZ    Czech (Czech Republic)
//tr_TR    Turkish (Turkey)
//es_PY    Spanish (Paraguay)
//tzm_Latn_MA    Central Morocco Tamazight (Latin, Morocco)
//lg    Ganda
//ebu    Embu
//en_HK    English (Hong Kong SAR China)
//nl_NL    Dutch (Netherlands)
//en_BE    English (Belgium)
//ms_MY    Malay (Malaysia)
//es_UY    Spanish (Uruguay)
//ar_BH    Arabic (Bahrain)
//kw_GB    Cornish (United Kingdom)
//ak    Akan
//chr    Cherokee
//dav    Taita
//lag_TZ    Langi (Tanzania)
//am    Amharic
//so_DJ    Somali (Djibouti)
//shi_Tfng_MA    Tachelhit (Tifinagh, Morocco)
//sr_Latn_ME    Serbian (Latin, Montenegro)
//sn_ZW    Shona (Zimbabwe)
//or_IN    Oriya (India)
//ar    Arabic
//as    Assamese
//fr_BI    French (Burundi)
//jmc_TZ    Machame (Tanzania)
//chr_US    Cherokee (United States)
//eu_ES    Basque (Spain)
//saq_KE    Samburu (Kenya)
//vun    Vunjo
//lt    Lithuanian
//naq_NA    Nama (Namibia)
//ga    Irish
//af_NA    Afrikaans (Namibia)
//kea_CV    Kabuverdianu (Cape Verde)
//es_DO    Spanish (Dominican Republic)
//lv    Latvian
//kok_IN    Konkani (India)
//de_LI    German (Liechtenstein)
//fr_BJ    French (Benin)
//az    Azerbaijani
//guz_KE    Gusii (Kenya)
//rw_RW    Kinyarwanda (Rwanda)
//mg_MG    Malagasy (Madagascar)
//km_KH    Khmer (Cambodia)
//gl    Galician
//shi_Tfng    Tachelhit (Tifinagh)
//ar_AE    Arabic (United Arab Emirates)
//fr_MQ    French (Martinique)
//rm    Romansh
//sv_SE    Swedish (Sweden)
//az_Cyrl    Azerbaijani (Cyrillic)
//ro    Romanian
//so_ET    Somali (Ethiopia)
//en_ZA    English (South Africa)
//ii_CN    Sichuan Yi (China)
//fr_BL    French (Saint Barthélemy)
//hi_IN    Hindi (India)
//gu    Gujarati
//mer_KE    Meru (Kenya)
//nn_NO    Norwegian Nynorsk (Norway)
//gv    Manx
//ru    Russian
//ar_DZ    Arabic (Algeria)
//ar_SY    Arabic (Syria)
//en_MP    English (Northern Mariana Islands)
//nl_BE    Dutch (Belgium)
//rw    Kinyarwanda
//be    Belarusian
//en_VI    English (U.S. Virgin Islands)
//es_CL    Spanish (Chile)
//bg    Bulgarian
//mg    Malagasy
//hy_AM    Armenian (Armenia)
//zu_ZA    Zulu (South Africa)
//guz    Gusii
//mk    Macedonian
//es_VE    Spanish (Venezuela)
//ml    Malayalam
//bm    Bambara
//khq_ML    Koyra Chiini (Mali)
//bn    Bengali
//ps_AF    Pashto (Afghanistan)
//so_SO    Somali (Somalia)
//sr_Cyrl    Serbian (Cyrillic)
//pl_PL    Polish (Poland)
//fr_GN    French (Guinea)
//bo    Tibetan
//om_KE    Oromo (Kenya)


@end
