import '../utils/enums.dart';

class Rules {
  static Map<ColorType, String> color = {
    ColorType.hex: r'^(#)?' +
        r'(' +
        r'(([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2}))' +
        r'|' +
        r'(([a-fA-F0-9]{1})([a-fA-F0-9]{1})([a-fA-F0-9]{1}))' +
        r')$',
    ColorType.rgb: r'^(rgb|RGB)[\s+]?\(' +
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])[\s+]?,' + // 0-255
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])[\s+]?,' + // 0-255
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])[\s+]?' + // 0-255
        r'\)[\s+]?$',
    ColorType.hsl: r'^(hsl|HSL)[\s+]?\(' +
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|[12][0-9]{2}|3[0-5][0-9]|360)[\s+]?,' + // 0-360
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|100)%[\s+]?,' + // 0-100
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|100)%[\s+]?' + // 0-100
        r'\)[\s+]?$',
    ColorType.hwb: r'^(hwb|HWB)[\s+]?\(' +
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|[12][0-9]{2}|3[0-5][0-9]|360)[\s+]?,' + // 0-360
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|100)%[\s+]?,' + // 0-100%
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|100)%[\s+]?' + // 0-100%
        r'\)[\s+]?$',
    ColorType.cmyk: r'^(cmyk|CMYK)[\s+]?\(' +
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|100)%[\s+]?,' + // 0-100%
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|100)%[\s+]?,' + // 0-100%
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|100)%[\s+]?,' + // 0-100%
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|100)%[\s+]?' + // 0-100%
        r'\)[\s+]?$',
    ColorType.ncol: r'^[\s+]?' +
        r'([rygcbm|RYGCBM]{1})(\d{1,3})[\s+]?,' + // 'R','Y','G','C','B','M' or 'r','y','g','c','b','m'
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|100)%[\s+]?,' + // 0-100%
        r'[\s+]?([0-9]|[1-8][0-9]|9[0-9]|100)%[\s+]?$', // 0-100%
  };

  static String email = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';

  static Map<GpsFormat, String> latitude = {
    GpsFormat.dd: r'^(' +
        r'(' +
        r'(([-+]?)([0-9]|[1-8][0-9]|90))' + // -90 -> 0
        r'|' +
        r'([0-9]|[1-8][0-9]|90)' + // 0 -> 90
        r')' +
        r'([.]\d{1,7})' + // decimals
        r')$',
    GpsFormat.dm: r'^((S|N)[\s+]?([0-9]|[1-8][0-9]|90)([°]))' + // 0 -> 90
        r'[\s+]?' +
        r'([0-9]|[1-4][0-9]|5[0-9])([.]\d{1,7})' + // 0 -> 59 + decimals
        r'$',
    GpsFormat.dms: r'^((S|N)[\s+]?([0-9]|[1-8][0-9]|90)([°]))' + // 0 -> 90
        r'[\s+]?' +
        r"([0-9]|[1-4][0-9]|5[0-9])(['])" + // 0 -> 59
        r'[\s+]?' +
        r'([0-9]|[1-4][0-9]|5[0-9])([.]\d{1,7}["])' + // 0 -> 59 + decimals
        r'$',
  };

  static Map<GpsFormat, String> longitude = {
    GpsFormat.dd: r'^(' +
        r'(' +
        r'(([-+]?)([0-9]|[1-8][0-9]|9[0-9]|1[0-7][0-9]|180))' + // -180 -> 0
        r'|' +
        r'([0-9]|[1-8][0-9]|9[0-9]|1[0-7][0-9]|180)' + // 0 -> 180
        r')' +
        r'([.]\d{1,7})' + // decimals
        r')$',
    GpsFormat.dm:
        r'^((E|W)[\s+]?([0-9]|[1-8][0-9]|9[0-9]|1[0-7][0-9]|180)([°]))' + // 0 -> 180
            r'[\s+]?' +
            r'([0-9]|[1-4][0-9]|5[0-9])([.]\d{1,7})' + // 0 -> 59 + decimals
            r'$',
    GpsFormat.dms:
        r'^((E|W)[\s+]?([0-9]|[1-8][0-9]|9[0-9]|1[0-7][0-9]|180)([°]))' + // 0 -> 180 + °
            r'[\s+]?' +
            r"([0-9]|[1-4][0-9]|5[0-9])(['])" + // 0 -> 59 + '
            r'[\s+]?' +
            r'([0-9]|[1-4][0-9]|5[0-9])([.]\d{1,7}["])' + // 0 -> 59 + decimals + "
            r'$',
  };

  static Map<String, String> phone = {
    'AD': r'',
    'AE': r'^(((\+|00)?971[\s\.-]?(\(0\)[\s\.-]?)?|0)(\(5(0|2|5|6)\)|5(0|2|5|6)|2|3|4|6|7|9)|60)([\s\.-]?[0-9]){7}$',
    'AF': r'',
    'AG': r'',
    'AI': r'',
    'AL': r'',
    'AM': r'',
    'AO': r'',
    'AQ': r'',
    'AR': r'',
    'AS': r'',
    'AT': r'',
    'AU': r'',
    'AW': r'',
    'AX': r'',
    'AZ': r'',
    'BA': r'',
    'BB': r'',
    'BD': r'',
    'BE': r'',
    'BF': r'',
    'BG': r'',
    'BH': r'',
    'BI': r'',
    'BJ': r'',
    'BL': r'',
    'BM': r'',
    'BN': r'',
    'BO': r'',
    'BQ': r'',
    'BR': r'^(([\d]{4}[-.\s]{1}[\d]{2,3}[-.\s]{1}[\d]{2}[-.\s]{1}[\d]{2})|([\d]{4}[-.\s]{1}[\d]{3}[-.\s]{1}[\d]{4})|((\(?\+?[0-9]{2}\)?\s?)?(\(?\d{2}\)?\s?)?\d{4,5}[-.\s]?\d{4}))$',
    'BS': r'',
    'BT': r'',
    'BV': r'',
    'BW': r'',
    'BY': r'',
    'BZ': r'',
    'CA': r'',
    'CC': r'',
    'CD': r'',
    'CF': r'',
    'CG': r'',
    'CH': r'',
    'CI': r'',
    'CK': r'',
    'CL': r'',
    'CM': r'',
    'CN': r'^((00|\+)?(86(?:-| )))?((\d{11})|(\d{3}[- ]{1}\d{4}[- ]{1}\d{4})|((\d{2,4}[- ]){1}(\d{7,8}|(\d{3,4}[- ]{1}\d{4}))([- ]{1}\d{1,4})?))$',
    'CO': r'',
    'CR': r'',
    'CU': r'',
    'CV': r'',
    'CW': r'',
    'CX': r'',
    'CY': r'',
    'CZ': r'^(((00)([- ]?)|\+)(420)([- ]?))?((\d{3})([- ]?)){2}(\d{3})$',
    'DE': r'^(((((((00|\+)49[ \-/]?)|0)[1-9][0-9]{1,4})[ \-/]?)|((((00|\+)49\()|\(0)[1-9][0-9]{1,4}\)[ \-/]?))[0-9]{1,7}([ \-/]?[0-9]{1,5})?)$',
    'DJ': r'',
    'DK': r'^(\+45|0045|\(45\))?\s?[2-9](\s?\d){7}$',
    'DM': r'',
    'DO': r'',
    'DZ': r'',
    'EC': r'',
    'EE': r'',
    'EG': r'',
    'EH': r'',
    'ER': r'',
    'ES': r'^(?:(?:(?:\+|00)34\D?))?(?:5|6|7|8|9)(?:\d\D?){8}$',
    'ET': r'',
    'FI': r'',
    'FJ': r'',
    'FK': r'',
    'FM': r'',
    'FO': r'',
    'FR': r'^(?:(?:(?:\+|00)33[ ]?(?:\(0\)[ ]?)?)|0){1}[1-9]{1}([ .-]?)(?:\d{2}\1?){3}\d{2}$',
    'GA': r'',
    'GB': r'^\(?(?:(?:0(?:0|11)\)?[\s-]?\(?|\+)44\)?[\s-]?\(?(?:0\)?[\s-]?\(?)?|0)(?:\d{2}\)?[\s-]?\d{4}[\s-]?\d{4}|\d{3}\)?[\s-]?\d{3}[\s-]?\d{3,4}|\d{4}\)?[\s-]?(?:\d{5}|\d{3}[\s-]?\d{3})|\d{5}\)?[\s-]?\d{4,5}|8(?:00[\s-]?11[\s-]?11|45[\s-]?46[\s-]?4\d))(?:(?:[\s-]?(?:x|ext\.?\s?|\#)\d+)?)$',
    'GD': r'',
    'GE': r'',
    'GF': r'',
    'GG': r'',
    'GH': r'',
    'GI': r'',
    'GL': r'',
    'GM': r'',
    'GN': r'',
    'GP': r'',
    'GQ': r'',
    'GR': r'',
    'GS': r'',
    'GT': r'',
    'GU': r'',
    'GW': r'',
    'GY': r'',
    'HK': r'',
    'HM': r'',
    'HN': r'',
    'HR': r'',
    'HT': r'',
    'HU': r'',
    'ID': r'',
    'IE': r'',
    'IL': r'',
    'IM': r'',
    'IN': r'((\+?)((0[ -]+)*|(91 )*)(\d{12}|\d{10}))|\d{5}([- ]*)\d{6}',
    'IO': r'',
    'IQ': r'',
    'IR': r'',
    'IS': r'',
    'IT': r'',
    'JE': r'',
    'JM': r'',
    'JO': r'',
    'JP': r'',
    'KE': r'',
    'KG': r'',
    'KH': r'',
    'KI': r'',
    'KM': r'',
    'KN': r'',
    'KP': r'',
    'KR': r'',
    'KW': r'',
    'KY': r'',
    'KZ': r'',
    'LA': r'',
    'LB': r'',
    'LC': r'',
    'LI': r'',
    'LK': r'',
    'LR': r'',
    'LS': r'',
    'LT': r'',
    'LU': r'',
    'LV': r'',
    'LY': r'',
    'MA': r'^(?:(?:(?:\+|00)212[\s]?(?:[\s]?\(0\)[\s]?)?)|0){1}(?:5[\s.-]?[2-3]|6[\s.-]?[13-9]){1}[0-9]{1}(?:[\s.-]?\d{2}){3}$',
    'MC': r'',
    'MD': r'',
    'ME': r'',
    'MF': r'',
    'MG': r'',
    'MH': r'',
    'MK': r'',
    'ML': r'',
    'MM': r'',
    'MN': r'',
    'MO': r'',
    'MP': r'',
    'MQ': r'',
    'MR': r'',
    'MS': r'',
    'MT': r'',
    'MU': r'',
    'MV': r'',
    'MW': r'',
    'MX': r'',
    'MY': r'',
    'MZ': r'',
    'NA': r'',
    'NC': r'',
    'NE': r'',
    'NF': r'',
    'NG': r'',
    'NI': r'',
    'NL': r'^((\+|00(\s|\s?\-\s?)?)31(\s|\s?\-\s?)?(\(0\)[\-\s]?)?|0)[1-9]((\s|\s?\-\s?)?[0-9])((\s|\s?-\s?)?[0-9])((\s|\s?-\s?)?[0-9])\s?[0-9]\s?[0-9]\s?[0-9]\s?[0-9]\s?[0-9]$',
    'NO': r'',
    'NP': r'',
    'NR': r'',
    'NU': r'',
    'NZ': r'',
    'OM': r'',
    'PA': r'',
    'PE': r'',
    'PF': r'',
    'PG': r'',
    'PH': r'',
    'PK': r'',
    'PL': r'',
    'PM': r'',
    'PN': r'',
    'PR': r'',
    'PS': r'',
    'PT': r'',
    'PW': r'',
    'PY': r'',
    'QA': r'',
    'RE': r'',
    'RO': r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$',
    'RS': r'',
    'RU': r'',
    'RW': r'',
    'SA': r'',
    'SB': r'',
    'SC': r'',
    'SD': r'',
    'SE': r'',
    'SG': r'',
    'SH': r'',
    'SI': r'',
    'SJ': r'',
    'SK': r'',
    'SL': r'',
    'SM': r'',
    'SN': r'',
    'SO': r'',
    'SR': r'',
    'SS': r'',
    'ST': r'',
    'SV': r'',
    'SX': r'',
    'SY': r'',
    'SZ': r'',
    'TC': r'',
    'TD': r'',
    'TF': r'',
    'TG': r'',
    'TH': r'',
    'TJ': r'',
    'TK': r'',
    'TL': r'',
    'TM': r'',
    'TN': r'',
    'TO': r'',
    'TR': r'',
    'TT': r'',
    'TV': r'',
    'TW': r'',
    'TZ': r'',
    'UA': r'',
    'UG': r'',
    'UM': r'',
    'US': r'^(?:(1\-?)|(\+1 ?))?\(?\d{3}\)?[\-\.\s]?\d{3}[\-\.\s]?\d{4}$',
    'UY': r'',
    'UZ': r'',
    'VA': r'',
    'VC': r'',
    'VE': r'',
    'VG': r'',
    'VI': r'',
    'VN': r'',
    'VU': r'',
    'WF': r'',
    'WS': r'',
    'YE': r'',
    'YT': r'',
    'ZA': r'',
    'ZM': r'',
    'ZW': r'',
  };

  static String url = r'^(?:(?:(?:http|https|ftp):)?\/\/)' +
      r'(?:\S+(?::\S*)?@)?' +
      r'(?:' +
      r'(?!(?:10|127)(?:\.\d{1,3}){3})' +
      r'(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})' +
      r'(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})' +
      r'(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])' +
      r'(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}' +
      r'(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))' +
      '|' +
      r'(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)' +
      r'(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,}))' +
      r')' +
      r'(?::\d{2,5})?' +
      r'(?:[/?#]\S*)?$';
}
