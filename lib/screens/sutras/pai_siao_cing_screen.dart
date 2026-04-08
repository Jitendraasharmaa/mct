import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../wigets/appBar_widget.dart';
import '../../wigets/sutra_text_widget.dart';

class PaiSiaoCingScreen extends StatelessWidget {
  const PaiSiaoCingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Pai Siao Cing"),
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
                firstRow: "天 地 重 孝 孝 當 先",
                secondRow: "Thien Ti Cong Siao Siao Tang Sien",
                thirdRow: "थेन ती चोङ स्याव स्याव ताङ सेन",
              ),
              SutraTextWidget(
                firstRow: "一 個 孝 字 全 家 安",
                secondRow: "Yi Ke Siao Ce Chien Cia An",
                thirdRow: "यी क स्याव च छेन च्या आन",
              ),
              SutraTextWidget(
                firstRow: "孝 順 能 生 孝 順 子",
                secondRow: "Siao Sun Neng Sheng Siao Sun Ce",
                thirdRow: "स्याव शुन नङ शङ स्याव शुन च",
              ),
              SutraTextWidget(
                firstRow: "孝 順 子 弟 必 明 賢",
                secondRow: "Siao Sun Ce Ti Pi Ming Sien",
                thirdRow: "स्याव शुन च ती पि मिङ सेन",
              ),
              SutraTextWidget(
                firstRow: "孝 是 人 道 第 一 步",
                secondRow: "Siao She Jen Tao Ti Yi Pu",
                thirdRow: "स्याव श रन ताव ती यी पु",
              ),
              SutraTextWidget(
                firstRow: "孝 子 謝 世 即 為 仙",
                secondRow: "Siao Ce Sie Se Ci Wei Sien",
                thirdRow: "स्याव च से श चि वे सेन",
              ),
              SutraTextWidget(
                firstRow: "自 古 忠 臣 多 孝 子",
                secondRow: "Ce Ku Cong Chen Tuo Siao Ce",
                thirdRow: "च कु चोङ छन तो स्याव च",
              ),
              SutraTextWidget(
                firstRow: "君 選 賢 臣 舉 孝 廉",
                secondRow: "Cin Sien Sien Chen Ci Siao Lien",
                thirdRow: "चिन सेन सेन छन चि स्याव लेन",
              ),
              SutraTextWidget(
                firstRow: "盡 心 竭 力 孝 父 母",
                secondRow: "Cin Sin Cie Li Siao Fu Mu",
                thirdRow: "चिन सिन चे ली स्याव फु मु",
              ),
              SutraTextWidget(
                firstRow: "孝 道 不 獨 講 吃 穿",
                secondRow: "Siao Tao Pu Tu Ciang Che Chuan",
                thirdRow: "स्याव ताव पु तु च्याङ छ छवान",
              ),
              SutraTextWidget(
                firstRow: "孝 道 貴 在 心 中 孝",
                secondRow: "Siao Tao Kuei Cai Sin Cong Siao",
                thirdRow: "स्याव ताव क्वे चाइ सिन चोङ स्याव",
              ),
              SutraTextWidget(
                firstRow: "孝 親 親 責 莫 回 言",
                secondRow: "Siao Chin Chin Ce Mo Hui Yen",
                thirdRow: "स्याव छिन छिन च मो हवे येन",
              ),
              SutraTextWidget(
                firstRow: "惜 乎 人 間 不 識 孝",
                secondRow: "Si Hu Jen Cien Pu She Siao",
                thirdRow: "सि हु रन चेन पु च स्याव",
              ),
              SutraTextWidget(
                firstRow: "回 心 復 孝 天 理 還",
                secondRow: "Hui Sin Fu Siao Thien Li Huan",
                thirdRow: "हवे सिन फु स्याव थेन ली हवान",
              ),
              SutraTextWidget(
                firstRow: "諸 事 不 順 因 不 孝",
                secondRow: "Cu She Pu Sun Yin Pu Siao",
                thirdRow: "चु श पु शुन यिन पु स्याव",
              ),
              SutraTextWidget(
                firstRow: "怎 知 孝 能 感 動 天",
                secondRow: "Cen Ce Siao Neng Kan Tong Thien",
                thirdRow: "चन च स्याव नङ कान तोङ थेन",
              ),
              SutraTextWidget(
                firstRow: "孝 道 貴 順 無 他 妙",
                secondRow: "Siao Tao Kuei Sun Wu Tha Miao",
                thirdRow: "स्याव ताव क्वे शुन वू था म्याव",
              ),
              SutraTextWidget(
                firstRow: "孝 順 不 分 女 共 男",
                secondRow: "Siao Sun Pu Fen Ni Kong Nan",
                thirdRow: "स्याव शुन पु फन नि कोङ नान",
              ),

              SutraTextWidget(
                firstRow: "福 祿 皆 由 孝 字 得",
                secondRow: "Fu Lu Cie You Siao Ce Te",
                thirdRow: "फु लू चे यो स्याव च त",
              ),
              SutraTextWidget(
                firstRow: "天 將 孝 子 另 眼 觀",
                secondRow: "Thien Ciang Siao Ce Ling Yen Kwan",
                thirdRow: "थेन च्याङ स्याव च लिङ येन क्वान",
              ),
              SutraTextWidget(
                firstRow: "人 人 都 可 孝 父 母",
                secondRow: "Jen Jen Tou Khe Siao Fu Mu",
                thirdRow: "रन रन तो ख स्याव फु मु",
              ),

              SutraTextWidget(
                firstRow: "孝 敬 父 母 如 敬 天",
                secondRow: "Siao Cing Fu Mu Ju Cing Thien",
                thirdRow: "स्याव चिङ फु मु रु चिङ थेन",
              ),
              SutraTextWidget(
                firstRow: "孝 子 口 裡 有 孝 語",
                secondRow: "Siao Ce Khou Li You Siao Yi",
                thirdRow: "स्याव च खो ली यो स्याव यि",
              ),
              SutraTextWidget(
                firstRow: "孝 婦 面 上 帶 孝 顏",
                secondRow: "Siao Fu Mien Shang Tai Siao Yen",
                thirdRow: "स्याव फु मेन शाङ ताई स्याव येन",
              ),

              SutraTextWidget(
                firstRow: "公 婆 上 邊 能 盡 孝",
                secondRow: "Kong Pho Shang Pien Neng Cin Siao",
                thirdRow: "कोङ फ़ो शाङ पेन नङ चिन स्याव",
              ),
              SutraTextWidget(
                firstRow: "又 落 孝 來 又 落 賢",
                secondRow: "You Luo Siao Lai You Luo Sien",
                thirdRow: "यो लो स्याव लाइ यो लो सेन",
              ),
              SutraTextWidget(
                firstRow: "女 得 淑 名 先 學 孝",
                secondRow: "Ni Te Shu Ming Sien Sie Siao",
                thirdRow: "नि त शु मिङ सेन से स्याव",
              ),

              SutraTextWidget(
                firstRow: "三 從 四 德 孝 在 前",
                secondRow: "San Chong Se Te Siao Cai Chien",
                thirdRow: "सान छोङ स त स्याव चाइ छेन",
              ),
              SutraTextWidget(
                firstRow: "孝 在 鄉 黨 人 欽 敬",
                secondRow: "Siao Cai Siang Tang Jen Chin Cing",
                thirdRow: "स्याव चाइ स्याङ ताङ रन छिन चिङ",
              ),
              SutraTextWidget(
                firstRow: "孝 在 家 中 大 小 歡",
                secondRow: "Siao Cai Cia Cong Ta Siao Huan",
                thirdRow: "स्याव चाइ च्या चोङ ता स्याव हवान",
              ),

              SutraTextWidget(
                firstRow: "孝 子 逢 人 就 勸 孝",
                secondRow: "Siao Ce Fong Jen Ciu Chien Siao",
                thirdRow: "स्याव च फोङ रन च्यो छेन स्याव",
              ),
              SutraTextWidget(
                firstRow: "孝 化 風 俗 人 品 端",
                secondRow: "Siao Hua Fong Su Jen Phing Tuan",
                thirdRow: "स्याव हवा फोङ सु रन फीङ त्वान",
              ),
              SutraTextWidget(
                firstRow: "生 前 孝 子 聲 價 貴",
                secondRow: "Sheng Chien Siao Ce Sheng Cia Kuei",
                thirdRow: "शङ छेन स्याव च शङ च्या क्वे",
              ),

              SutraTextWidget(
                firstRow: "死 後 孝 子 萬 古 傳",
                secondRow: "Se Hou Siao Ce Wan Ku Chuan",
                thirdRow: "स हो स्याव च वान कु छवान",
              ),
              SutraTextWidget(
                firstRow: "處 世 惟 有 孝 力 大",
                secondRow: "Chu She Wei You Siao Li Ta",
                thirdRow: "छु श वे यो स्याव ली ता",
              ),
              SutraTextWidget(
                firstRow: "孝 能 感 動 地 合 天",
                secondRow: "Siao Neng Kan Tong Ti He Thien",
                thirdRow: "स्याव नङ कान तोङ ती ह थेन",
              ),

              SutraTextWidget(
                firstRow: "孝 經 孝 文 把 孝 勸",
                secondRow: "Siao Cing Siao Wen Pa Siao Chien",
                thirdRow: "स्याव चिङ स्याव वन पा स्याव छेन",
              ),
              SutraTextWidget(
                firstRow: "孝 父 孝 母 孝 祖 先",
                secondRow: "Siao Fu Siao Mu Siao Cu Sien",
                thirdRow: "स्याव फु स्याव मु स्याव चु सेन",
              ),
              SutraTextWidget(
                firstRow: "父 母 生 子 原 為 孝",
                secondRow: "Fu Mu Sheng Ce Yen Wei Siao",
                thirdRow: "फु मु शङ च येन वे स्याव",
              ),
              SutraTextWidget(
                firstRow: "能 孝 就 是 好 兒 男",
                secondRow: "Neng Siao Ciu She Hao Er Nan",
                thirdRow: "नङ स्याव च्यो श हाव अर नान",
              ),
              SutraTextWidget(
                firstRow: "為 人 能 把 父 母 孝",
                secondRow: "Wei Jen Neng Pa Fu Mu Siao",
                thirdRow: "वे रन नङ पा फु मु स्याव",
              ),
              SutraTextWidget(
                firstRow: "下 輩 孝 子 照 樣 還",
                secondRow: "Sia Pei Siao Ce Cao Yang Huan",
                thirdRow: "स्या पे स्याव च चाव याङ हवान",
              ),

              SutraTextWidget(
                firstRow: "堂 上 父 母 不 知 孝",
                secondRow: "Thang Shang Fu Mu Pu Ce Siao",
                thirdRow: "थाङ शाङ फु मु पु च स्याव",
              ),
              SutraTextWidget(
                firstRow: "不 孝 受 窮 莫 怨 天",
                secondRow: "Pu Siao Shou Chiung Mo Yen Thien",
                thirdRow: "पु स्याव शो छ्योङ मो येन थेन",
              ),
              SutraTextWidget(
                firstRow: "孝 子 面 帶 太 和 象",
                secondRow: "Siao Ce Mien Tai Thai He Siang",
                thirdRow: "स्याव च मेन ताई थाई ह स्याङ",
              ),

              SutraTextWidget(
                firstRow: "入 孝 出 悌 自 然 安",
                secondRow: "Ju Siao Chu Thi Ce Jan An",
                thirdRow: "रु स्याव छु थी च रान आन",
              ),
              SutraTextWidget(
                firstRow: "親 在 應 孝 不 知 孝",
                secondRow: "Chin Cai Ying Siao Pu Ce Siao",
                thirdRow: "छिन चाइ यिङ स्याव पु च स्याव",
              ),
              SutraTextWidget(
                firstRow: "親 死 知 孝 後 悔 難",
                secondRow: "Chin Se Ce Siao Hou Huei Nan",
                thirdRow: "छिन स च स्याव हो हवे नान",
              ),

              SutraTextWidget(
                firstRow: "孝 在 心 孝 不 在 貌",
                secondRow: "Siao Cai Sin Siao Pu Cai Mao",
                thirdRow: "स्याव चाइ सिन स्याव पु चाइ माव",
              ),
              SutraTextWidget(
                firstRow: "孝 貴 實 行 不 在 言",
                secondRow: "Siao Kuei Se Sing Pu Cai Yen",
                thirdRow: "स्याव क्वे से सिङ पु चाइ येन",
              ),
              SutraTextWidget(
                firstRow: "孝 子 齊 家 全 家 樂",
                secondRow: "Siao Ce Chi Cia Chien Cia Le",
                thirdRow: "स्याव च छि च्या छेन च्या ल",
              ),

              SutraTextWidget(
                firstRow: "孝 子 治 國 萬 民 安",
                secondRow: "Siao Ce Ce Kuo Wan Min An",
                thirdRow: "स्याव च च को वान मिन आन",
              ),
              SutraTextWidget(
                firstRow: "五 穀 豐 登 皆 因 孝",
                secondRow: "Wu Ku Fong Teng Cie Yin Siao",
                thirdRow: "वू कु फोङ तङ चे यिन स्याव",
              ),
              SutraTextWidget(
                firstRow: "一 季 孝 即 是 太 平 年",
                secondRow: "Yi Siao Ci She Thai Phing Nien",
                thirdRow: "यी स्याव चि श थाई फ्रीङ नेन",
              ),

              SutraTextWidget(
                firstRow: "能 孝 不 在 貧 和 富",
                secondRow: "Neng Siao Pu Cai Phin He Fu",
                thirdRow: "नङ स्याव पु चाइ फीन ह फु",
              ),
              SutraTextWidget(
                firstRow: "善 體 親 心 是 孝 男",
                secondRow: "Shan Thi Chin Sin She Siao Nan",
                thirdRow: "शान थी छिन सिन श स्याव नान",
              ),
              SutraTextWidget(
                firstRow: "兄 弟 和 睦 即 為 孝",
                secondRow: "Siong Ti He Mu Ci Wei Siao",
                thirdRow: "स्योङ ती ह मु चि वे स्याव",
              ),

              SutraTextWidget(
                firstRow: "忍 讓 二 字 把 孝 全",
                secondRow: "Jen Jang Er Ce Pa Siao Chien",
                thirdRow: "रन राङ अर च पा स्याव छेन",
              ),
              SutraTextWidget(
                firstRow: "孝 從 難 處 見 真 孝",
                secondRow: "Siao Chong Nan Chu Cien Cen Siao",
                thirdRow: "स्याव छोङ नान छु चेन चन स्याव",
              ),
              SutraTextWidget(
                firstRow: "孝 容 滿 面 承 親 顏",
                secondRow: "Siao Rong Man Mien Cheng Chin Yen",
                thirdRow: "स्याव रोड मान मेन छङ छिन येन",
              ),

              SutraTextWidget(
                firstRow: "父 母 雙 全 正 宜 孝",
                secondRow: "Fu Mu Suang Chien Ceng Yi Siao",
                thirdRow: "फु मु श्वाङ छेन चङ यी स्याव",
              ),
              SutraTextWidget(
                firstRow: "孝 思 鰥 寡 親 影 單",
                secondRow: "Siao Se Kuan Kua Chin Ying Tan",
                thirdRow: "स्याव स क्वान क्वा छिन यिङ तान",
              ),
              SutraTextWidget(
                firstRow: "趕 緊 孝 來 光 陰 快",
                secondRow: "Kan Cin Siao Lai Kuang Yin Khuai",
                thirdRow: "कान चिन स्याव लाइ क्वाङ यिन ख्वाइ",
              ),

              SutraTextWidget(
                firstRow: "親 由 我 孝 壽 由 天",
                secondRow: "Chin You Wo Siao Shou You Thien",
                thirdRow: "छिन यो वो स्याव शो यो थेन",
              ),
              SutraTextWidget(
                firstRow: "生 前 能 孝 方 為 孝",
                secondRow: "Sheng Chien Neng Siao Fang Wei Siao",
                thirdRow: "शङ छेन नङ स्याव फाङ वे स्याव",
              ),
              SutraTextWidget(
                firstRow: "死 後 盡 孝 徒 枉 然",
                secondRow: "Se Hou Cin Siao Thu Wang Jan",
                thirdRow: "स हो चिन स्याव थु वाङ रान",
              ),

              SutraTextWidget(
                firstRow: "孝 順 傳 家 孝 是 寶",
                secondRow: "Siao Shun Chuan Cia Siao She Pao",
                thirdRow: "स्याव शुन छवान च्या स्याव श पाव",
              ),
              SutraTextWidget(
                firstRow: "孝 性 溫 和 孝 味 甘",
                secondRow: "Siao Sing Wen He Siao Wei Kan",
                thirdRow: "स्याव सिङ वन ह स्याव वे कान",
              ),
              SutraTextWidget(
                firstRow: "羊 羔 跪 乳 尚 知 孝",
                secondRow: "Yang Kao Kuei Ru Shang Ce Siao",
                thirdRow: "याङ काव क्वे रु शाङ च स्याव",
              ),

              SutraTextWidget(
                firstRow: "烏 鴉 反 哺 孝 親 顏",
                secondRow: "Wu Ya Fan Fu Siao Chin Yen",
                thirdRow: "वू या फान पु स्याव छिन येन",
              ),
              SutraTextWidget(
                firstRow: "為 人 若 是 不 知 孝",
                secondRow: "Wei Jen Juo She Pu Ce Siao",
                thirdRow: "वे रन रो श पु च स्याव",
              ),
              SutraTextWidget(
                firstRow: "不 如 禽 獸 實 可 憐",
                secondRow: "Pu Ju Chin Shou She Khe Lien",
                thirdRow: "पु रु छिन शो श ख लेन",
              ),

              SutraTextWidget(
                firstRow: "百 行 萬 善 孝 為 首",
                secondRow: "Pai Heng Wan Shan Siao Wei Shou",
                thirdRow: "पाइ हङ वान शान स्याव वे शो",
              ),
              SutraTextWidget(
                firstRow: "當 知 孝 字 是 根 源",
                secondRow: "Tang Ce Siao Ce She Ken Yen",
                thirdRow: "ताङ च स्याव च श कन येन",
              ),
              SutraTextWidget(
                firstRow: "念 佛 行 善 也 是 孝",
                secondRow: "Nien Fo Sing Shan Ye She Siao",
                thirdRow: "नेन फो सिङ शान ये श स्याव",
              ),

              SutraTextWidget(
                firstRow: "孝 仗 佛 力 超 九 天",
                secondRow: "Siao Cang Fo Li Chao Ciu Thien",
                thirdRow: "स्याव चाङ फो ली छाव च्यो थेन",
              ),
              SutraTextWidget(
                firstRow: "大 哉 孝 乎 大 哉 孝",
                secondRow: "Ta Cai Siao Hu Ta Cai Siao",
                thirdRow: "ता चाइ स्याव हु ता चाइ स्याव",
              ),
              SutraTextWidget(
                firstRow: "孝 矣 無 窮 孝 無 邊",
                secondRow: "Siao Yi Wu Chiung Siao Wu Pien",
                thirdRow: "स्याव यी वू छ्योङ स्याव वू पेन",
              ),
              SutraTextWidget(
                firstRow: "此 篇 句 句 不 離 孝",
                secondRow: "Che Phien Ci Ci Pu Li Siao",
                thirdRow: "छ फ़ेन चि चि पु ली स्याव",
              ),
              SutraTextWidget(
                firstRow: "離 孝 人 倫 顛 倒 顛",
                secondRow: "Li Siao Jen Lun Thien Tao Thien",
                thirdRow: "ली स्याव रन लुन तेन ताव तेन",
              ),
              SutraTextWidget(
                firstRow: "念 得 十 遍 千 個 孝",
                secondRow: "Nien Te She Pien Chien Ke Siao",
                thirdRow: "नेन त श पेन छेन क स्याव",
              ),

              SutraTextWidget(
                firstRow: "念 得 百 遍 萬 孝 全",
                secondRow: "Nien Te Pai Pien Wan Siao Chien",
                thirdRow: "नेन त पाइ पेन वान स्याव छेन",
              ),
              SutraTextWidget(
                firstRow: "千 遍 萬 遍 常 常 念",
                secondRow: "Chien Pien Wan Pien Chang Chang Nien",
                thirdRow: "छेन पेन वान पेन छाङ छाङ नेन",
              ),
              SutraTextWidget(
                firstRow: "消 災 免 難 百 孝 篇",
                secondRow: "Siao Cai Mien Nan Pai Siao Phien",
                thirdRow: "स्याव चाइ मेन नान पाइ स्याव फेन",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
