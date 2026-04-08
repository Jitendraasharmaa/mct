import 'package:flutter/material.dart';
import 'package:mct_prayer_book/wigets/appBar_widget.dart';
import 'package:mct_prayer_book/wigets/sutra_text_widget.dart';

import '../../constants/app_colors.dart';

class MiLekCiuKhuCenCingScreen extends StatelessWidget {
  const MiLekCiuKhuCenCingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Mi Lek Cui Khu Cen Cin"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              SutraTextWidget(
                firstRow: "佛 說 彌 勒 救 苦 經",
                secondRow: "Fo Shuo Mi Le Ciu Khu Cing",
                thirdRow: "फो शो मि ल च्यो ख चिंग",
              ),
              SutraTextWidget(
                firstRow: "彌 勒 下 世 不 非 輕",
                secondRow: "Mi Le Sia Se Pu Fei Ching",
                thirdRow: "मि ल स्या श पु फे छिङ",
              ),
              SutraTextWidget(
                firstRow: "領 寶 齊 魯 靈 山 地",
                secondRow: "Ling Pao Chi Lu Ling Shan Ti",
                thirdRow: "लिंग पाव छी लु लिंग शान ती",
              ),
              SutraTextWidget(
                firstRow: "拈 花 印 證 考 三 乘",
                secondRow: "Nien Hua Yin Chen Khao San Shen",
                thirdRow: "ननेन हवा यिन चङ खाव सान शङ",
              ),
              SutraTextWidget(
                firstRow: "落 在 中 原 三 星 地",
                secondRow: "Luo Cai Cong Yen San Sing Ti",
                thirdRow: "लो चाइ चोङ येन सान सिङ ती",
              ),
              SutraTextWidget(
                firstRow: "大 證 四 川 王 桃 心",
                secondRow: "Ta Cen Se Chuan Wang Thao Sin",
                thirdRow: "ता चङ स छवान वाङ थाव सिन",
              ),
              SutraTextWidget(
                firstRow: "天 真 收 圓 掛 聖 號",
                secondRow: "Thien Cen Shou Yen Kua Sheng Hao",
                thirdRow: "थेन चन शो येन क्वा शङ हाव",
              ),
              SutraTextWidget(
                firstRow: "等 待 時 至 點 神 兵",
                secondRow: "Teng Tai Se Ce Tien Shen Ping",
                thirdRow: "तङ ताई श च तेन शन पिंड",
              ),
              SutraTextWidget(
                firstRow: "雲 雷 震 開 戊 己 土",
                secondRow: "Yin Lei Cen Khai Wu Ci Thu",
                thirdRow: "यिन ले चन खाइ वु चि थु",
              ),
              SutraTextWidget(
                firstRow: "天 下 神 鬼 不 安 寧",
                secondRow: "Thien Sia Shen Kuei Pu An Ning",
                thirdRow: "थेन स्या शन क्वे पु आन निङ",
              ),

              SutraTextWidget(
                firstRow: "親 在 仁 天 中 華 母",
                secondRow: "Chin Cai Jen Thien Cong Hua Mu",
                thirdRow: "छिन चाइ रन थेन चोङ हवा मु",
              ),

              SutraTextWidget(
                firstRow: "九 蓮 聖 教 歸 上 乘",
                secondRow: "Ciu Lien Sheng Ciao Kuei Shang Sheng",
                thirdRow: "च्यो लेन शङ च्याव क्वे शाङ शङ",
              ),
              SutraTextWidget(
                firstRow: "天 花 老 中 垂 玉 線",
                secondRow: "Thien Hua Lao Mu Chuei Ik Sien",
                thirdRow: "थेन हवा लाव मु छ्वे यि सेन",
              ),

              SutraTextWidget(
                firstRow: "收 圓 顯 化 在 古 東",
                secondRow: "Shou Yen Sien Hua Cai Ku Tong",
                thirdRow: "शो येन सेन हवा चाइ कु तोङ",
              ),

              SutraTextWidget(
                firstRow: "南 北 兩 極 連 宗 緒",
                secondRow: "Nan Pei Liang Ci Lien Cong Si",
                thirdRow: "नान पे ल्याङ चि लेन चोङ सि",
              ),
              SutraTextWidget(
                firstRow: "混 元 古 冊 在 中 央",
                secondRow: "Huen Yen Ku Che Cai Cong Yang",
                thirdRow: "हुन येन कु छ चाइ चोङ याङ",
              ),

              SutraTextWidget(
                firstRow: "老 中 降 下 通 天 竅",
                secondRow: "Lao Mu Ciang Sia Thong Thien Ciao",
                thirdRow: "लाव मु च्याङ स्या थोङ थेन छ्याव",
              ),

              SutraTextWidget(
                firstRow: "無 影 山 前 對 合 同",
                secondRow: "Wu Ying Shan Chien Tuei He Thong",
                thirdRow: "वु यिङ शान छैन त्वे ह थोङ",
              ),

              SutraTextWidget(
                firstRow: "嬰 兒 要 想 歸 家 去",
                secondRow: "Ying Er Yao Siang Kuei Cia Chi",
                thirdRow: "यिङ अर याव स्याङ क्वे च्या छि",
              ),

              SutraTextWidget(
                firstRow: "持 念 當 來 彌 勒 經",
                secondRow: "Che Nien Tang Lai Mi Lek Cing",
                thirdRow: "छ नेन ताङ लाइ मि ल चिङ",
              ),

              SutraTextWidget(
                firstRow: "用 心 持 念 佛 來 救",
                secondRow: "Yong Sin Che Nien Fo Lai Ciu",
                thirdRow: "योङ सिन छ नेन फो लाइ च्यो",
              ),
              SutraTextWidget(
                firstRow: "朵 朵 金 蓮 去 超 生",
                secondRow: "Tuo Tuo Cin Lien Chi Chao Shen",
                thirdRow: "तो तो चिन लेन छि छाव शङ",
              ),

              SutraTextWidget(
                firstRow: "識 得 西 來 白 陽 子",
                secondRow: "She Te Si Lai Pai Yang Ce",
                thirdRow: "श त सि लाइ पाइ याङ च",
              ),

              SutraTextWidget(
                firstRow: "鄉 兒 點 鐵 化 成 金",
                secondRow: "Siang Er Tien Thie Hua Cheng Cin",
                thirdRow: "स्याङ अर तेन थे हवा छङ चिन",
              ),

              SutraTextWidget(
                firstRow: "每 日 志 心 常 持 念",
                secondRow: "Mei Je Ce Sin Chang Che Nien",
                thirdRow: "मे र च सिन छाङ छ नेन",
              ),

              SutraTextWidget(
                firstRow: "三 災 八 難 不 來 侵",
                secondRow: "San Cai Pa Nan Pu Lai Chin",
                thirdRow: "सान चाइ पा नान पु लाइ छिन",
              ),

              SutraTextWidget(
                firstRow: "要 想 成 佛 勤 禮 拜",
                secondRow: "Yao Siang Chen Fo Chin Li Pai",
                thirdRow: "याव स्याङ छन फो छिन ली पाई",
              ),

              SutraTextWidget(
                firstRow: "常 持 聰 明 智 慧 心",
                secondRow: "Chang Che Chong Ming Ce Huei Sin",
                thirdRow: "छाङ छ छोङ मिङ च हवे सिन",
              ),

              SutraTextWidget(
                firstRow: "休 聽 邪 人 胡 說 話",
                secondRow: "Siu Thing Sie Jen Hu Shuo Hua",
                thirdRow: "स्यो थिङ से रन हु शो हवा",
              ),

              SutraTextWidget(
                firstRow: "牢 拴 意 馬 念 無 生",
                secondRow: "Lao Suan Yi Ma Nien Wu Sheng",
                thirdRow: "लाव श्वान यी मा नेन वु शङ",
              ),

              SutraTextWidget(
                firstRow: "老 中 降 下 真 天 咒",
                secondRow: "Lao Mu Ciang Sia Cen Thien Cou",
                thirdRow: "लाव मु च्याङ स्या चन थेन चो",
              ),

              SutraTextWidget(
                firstRow: "用 心 持 念 有 神 通",
                secondRow: "Yong Sin Che Nien You Shen Thong",
                thirdRow: "योङ सिन छ नेन यो शन थोङ",
              ),

              SutraTextWidget(
                firstRow: "滿 天 星 斗 都 下 世",
                secondRow: "Man Thien Sing Tou Tou Sia Se",
                thirdRow: "मान थेन सिङ तो तो स्या श",
              ),
              SutraTextWidget(
                firstRow: "五 方 列 仙 下 天 宮",
                secondRow: "Wu Fang Lie Sien Sia Thien Kong",
                thirdRow: "वु फाङ ले सेन स्या थेन कोङ",
              ),

              SutraTextWidget(
                firstRow: "各 方 城 隍 來 對 號",
                secondRow: "Ke Fang Cheng Huang Lai Tuei Hao",
                thirdRow: "क फाङ छङ हवाङ लाइ त्वे हाव",
              ),

              SutraTextWidget(
                firstRow: "報 事 靈 童 察 的 清",
                secondRow: "Pao She Ling Thong Cha Te Ching",
                thirdRow: "पाव श लिङ थोङ छा त छिङ",
              ),
              SutraTextWidget(
                firstRow: "三 官 慈 悲 大 帝 主",
                secondRow: "San Kuan Che Pei Ta Ti Cu",
                thirdRow: "सान क्वान छ पे ता ती चु",
              ),

              SutraTextWidget(
                firstRow: "赦 罪 三 曹 救 眾 生",
                secondRow: "She Cuei San Chao Ciu Cong Sheng",
                thirdRow: "श च्वे सान छाव च्यो चोङ शङ",
              ),

              SutraTextWidget(
                firstRow: "救 苦 天 尊 來 救 世",
                secondRow: "Ciu Khu Thien Cun Lai Ciu Se",
                thirdRow: "च्यो खु थेन चुन लाइ च्यो श",
              ),

              SutraTextWidget(
                firstRow: "親 點 文 部 揭 地 神",
                secondRow: "Chin Tien Wen Pu Cie Ti Shen",
                thirdRow: "छिन तेन वन पु चे ती शन",
              ),

              SutraTextWidget(
                firstRow: "八 大 金 剛 來 護 法",
                secondRow: "Pa Ta Cin Kang Lai Hu Fa",
                thirdRow: "पा ता चिन काङ लाइ हु फा",
              ),

              SutraTextWidget(
                firstRow: "四 位 菩 薩 救 眾 生",
                secondRow: "Se Wei Phu Sha Ciu Cong Sheng",
                thirdRow: "स वे फु सा च्यो चोङ शङ",
              ),

              SutraTextWidget(
                firstRow: "緊 領 三 十 六 員 將",
                secondRow: "Cin Ling San She Liu Yen Ciang",
                thirdRow: "चिन लिङ सान श ल्यो येन च्याङ",
              ),

              SutraTextWidget(
                firstRow: "五 百 靈 官 緊 隨 跟",
                secondRow: "Wu Pai Ling Kuan Cin Suei Ken",
                thirdRow: "वु पाइ लिङ क्वान चिन स्वे कन",
              ),

              SutraTextWidget(
                firstRow: "扶 助 彌 勒 成 大 道",
                secondRow: "Fu Cu Mi Le Cheng Ta Tao",
                thirdRow: "फु चु मि ल छङ ता ताव",
              ),

              SutraTextWidget(
                firstRow: "保 佑 鄉 兒 得 安 寧",
                secondRow: "Pao You Siang Er Te An Ning",
                thirdRow: "पाव यो स्याङ अर त आन निङ",
              ),

              SutraTextWidget(
                firstRow: "北 方 真 武 為 將 帥",
                secondRow: "Pei Fang Cen Wu Wei Ciang Shuai",
                thirdRow: "पे फाङ चन वु वे च्याङ श्वाई",
              ),

              SutraTextWidget(
                firstRow: "青 臉 紅 髮 顯 神 通",
                secondRow: "Ching Lien Hong Fa Sien Shen Thong",
                thirdRow: "छिङ लेन होङ फा सेन शन थोङ",
              ),

              SutraTextWidget(
                firstRow: "扯 起 皂 旗 遮 日 月",
                secondRow: "Che Chi Cao Chi Ce Je Ye",
                thirdRow: "छ छि चाव छि च र ये",
              ),

              SutraTextWidget(
                firstRow: "頭 頂 森 羅 七 寶 星",
                secondRow: "Thou Ting Shen Luo Chi Pao Sing",
                thirdRow: "थोउ तिङ सन लो छि पाव सिङ",
              ),

              SutraTextWidget(
                firstRow: "威 鎮 北 方 為 帥 首",
                secondRow: "Wei Cen Pei Fang Wei Shuai Shou",
                thirdRow: "वे चन पे फाङ वे श्वाई शो",
              ),

              SutraTextWidget(
                firstRow: "速 請 諸 惡 掛 甲 兵",
                secondRow: "Shu Ching Cu Ek Kua Cia Ping",
                thirdRow: "सु छिङ चु अ क्वा च्या पिङ",
              ),

              SutraTextWidget(
                firstRow: "搭 救 原 人 鄉 兒 女",
                secondRow: "Ta Ciu Yen Jen Siang Er Ni",
                thirdRow: "ता च्यो येन रन स्याङ अर नि",
              ),

              SutraTextWidget(
                firstRow: "火 光 落 地 化 為 塵",
                secondRow: "Huo Kuang Luo Ti Hua Wei Chen",
                thirdRow: "हो क्वाङ लो ती हवा वे छन",
              ),

              SutraTextWidget(
                firstRow: "四 海 龍 王 來 助 道",
                secondRow: "Se Hai Long Wang Lai Cu Tao",
                thirdRow: "स हाइ लोङ वाङ लाइ चु ताव",
              ),

              SutraTextWidget(
                firstRow: "各 駕 祥 雲 去 騰 空",
                secondRow: "Ke Cia Siang Yin Chi Theng Khong",
                thirdRow: "क च्या स्याङ यिन छि थङ खोङ",
              ),

              SutraTextWidget(
                firstRow: "十 方 天 兵 護 佛 駕",
                secondRow: "Se Fang Thien Ping Hu Fo Cia",
                thirdRow: "श फाङ थेन पिङ हु फो च्या",
              ),
              SutraTextWidget(
                firstRow: "保 佑 彌 勒 去 成 功",
                secondRow: "Pao You Mi Lek Chi Cheng Kong",
                thirdRow: "पाव यो मि ल छि छङ कोङ",
              ),

              SutraTextWidget(
                firstRow: "紅 陽 了 道 歸 家 去",
                secondRow: "Hong Yang Liao Tao Kuei Cia Chi",
                thirdRow: "होङ याङ ल्याव ताव क्वे च्या छि",
              ),

              SutraTextWidget(
                firstRow: "轉 到 三 陽 彌 勒 尊",
                secondRow: "Cuan Tao San Yang Mi lek Cun",
                thirdRow: "च्वान ताव सान याङ मि ल चुन",
              ),

              SutraTextWidget(
                firstRow: "無 皇 敕 令 記 下 生",
                secondRow: "Wu Huang Che Ling Ci Sia Sheng",
                thirdRow: "वु हवाङ छ लिङ चि स्या शङ",
              ),

              SutraTextWidget(
                firstRow: "收 伏 南 閻 歸 正 宗",
                secondRow: "Shou Fu Nan Yen Kuei Ceng Cong",
                thirdRow: "शो फु नान येन क्वे चङ चोङ",
              ),

              SutraTextWidget(
                firstRow: "來 往 造 下 真 言 咒",
                secondRow: "Lai Wang Cao Sia Cen Yen Cou",
                thirdRow: "लाइ वाङ चाव स्या चन येन चो",
              ),

              SutraTextWidget(
                firstRow: "傳 下 當 來 大 藏 經",
                secondRow: "Chuan Sia Tang Lai Ta Cang Cing",
                thirdRow: "छवान स्या ताङ लाइ ता चाङ चिङ",
              ),

              SutraTextWidget(
                firstRow: "嬰 兒 姹 女 常 持 念",
                secondRow: "Ying Er Cha Nii Chang Che Nien",
                thirdRow: "यिङ अर छा नि छाङ छ नेन",
              ),

              SutraTextWidget(
                firstRow: "邪 神 不 敢 來 近 身",
                secondRow: "Sie Shen Pu Kan Lai Cin Shen",
                thirdRow: "से शन पु कान लाइ चिन शन",
              ),

              SutraTextWidget(
                firstRow: "持 念 一 遍 神 通 大",
                secondRow: "Che Nien Yi Pien Shen Thong Ta",
                thirdRow: "छ नेन यी पेन शन थोङ ता",
              ),

              SutraTextWidget(
                firstRow: "持 念 兩 遍 得 超 生",
                secondRow: "Che Nien Liang Pien Te Chao Sheng",
                thirdRow: "छ नेन ल्याङ पेन त छाव शङ",
              ),

              SutraTextWidget(
                firstRow: "持 念 三 遍 神 鬼 怕",
                secondRow: "Che Nien San Pien Shen Kuei Pha",
                thirdRow: "छ नेन सान पेन शन क्वे फ़ा",
              ),

              SutraTextWidget(
                firstRow: "魍 魎 邪 魔 化 為 塵",
                secondRow: "Wang Liang Sie Mo Hua Wei Chen",
                thirdRow: "वाङ ल्याङ से मो हवा वे छन",
              ),

              SutraTextWidget(
                firstRow: "修 持 劫 內 尋 路 徑",
                secondRow: "Siu Che Cie Nei Siin Lu Cing",
                thirdRow: "स्यो छ चे ने सिन लु चिङ",
              ),

              SutraTextWidget(
                firstRow: "念 起 真 言 歸 佛 令",
                secondRow: "Nien Chi Cen Yen Kuei Fo Ling",
                thirdRow: "नेन छि चन येन क्वे फो लिङ",
              ),

              SutraTextWidget(
                firstRow: "南 無 天 元 太 保 阿 彌 陀 佛",
                secondRow: "Nan Mo Thien Yen Tai Pao A Mi Thuo Fo",
                thirdRow: "नान मो थेन येन थाई पाव आ मि थो फो",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
