import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'nabeeh_colors.dart';
import '../widgets/sign_language_box.dart';

/// سؤال وجوابه بصفحة الأسئلة الشائعة
class _FaqItem {
  final String question;
  final String answer;
  const _FaqItem(this.question, this.answer);
}

/// لإضافة سؤال جديد: أضيفيه هنا فقط، والصفحة تعرضه تلقائيًا.
const List<_FaqItem> _kFaqItems = [
  _FaqItem(
    'كيف أربط الساعة بالتطبيق؟',
    '١. حرّك المفتاح الموجود خلف الساعة إلى وضع التشغيل، وستضيء الشاشة.\n'
        '٢. من إعدادات الساعة، اضغط «شبكة الإنترنت»، ثم «تغيير الشبكة».\n'
        '٣. من جوالك، اتصل بالشبكة الظاهرة على شاشة الساعة.\n'
        '٤. اختر شبكة الإنترنت التي تريد استخدامها، ثم أدخل كلمة المرور و«رمز الإعداد» الظاهر على شاشة الساعة.\n'
        '٥. تأكد أن جوالك متصل بشبكة الإنترنت نفسها، ثم افتح تطبيق نبيه في جوالك، وسيتم الربط تلقائيًا.\n'
        '٦. للتأكد من الربط، افتح صفحة «الساعة» في التطبيق، وستظهر حالة الساعة: «متصلة».',
  ),
  _FaqItem(
    'هل يمكن ربط الساعة بأكثر من جوال؟',
    'لا، الساعة ترتبط بجوال واحد فقط. لنقلها إلى جوال آخر، اضغط «إلغاء ارتباط الهاتف» من إعدادات الساعة، '
        'ثم اربطها بالجوال الجديد.',
  ),
  _FaqItem(
    'هل يحتاج نبيه إلى إنترنت؟',
    'نعم، التعرف على الأصوات يتم عبر الإنترنت، لذلك يجب أن يكون الجوال متصلًا بالإنترنت أثناء الاستماع.',
  ),
  _FaqItem(
    'ما الأصوات التي يتعرف عليها نبيه؟',
    'خمسة أصوات: بكاء الطفل، جرس الباب، طرق الباب، إنذار الحريق، والأذان. لا يصلك تنبيه بالأصوات الأخرى.',
  ),
  _FaqItem(
    'كيف أعرف أن الساعة متصلة؟',
    'افتح صفحة «الساعة» في التطبيق، وستظهر لك حالة الساعة: «متصلة» أو «غير متصلة». '
        'وتظهر حالة الاتصال بالجوال أيضًا في أعلى الشاشة الرئيسية للساعة.',
  ),
  _FaqItem(
    'هل تعمل الساعة إذا كان جوالي بعيدًا أو مغلقًا؟',
    'التنبيه بالأصوات لا يعمل إلا إذا كان الجوال يعمل ومتصلًا بالإنترنت، وعلى نفس شبكة الواي فاي مع الساعة. '
        'أما المنبهات، فتهتز لها الساعة في وقتها حتى لو كان الجوال بعيدًا أو مغلقًا.',
  ),
  _FaqItem(
    'هل تصلني التذكيرات على الساعة؟',
    'نعم. في وقت المنبه تهتز الساعة ويظهر عليها اسم المنبه، ويصلك إشعار على الجوال أيضًا. '
        'بعد إضافة منبه أو تعديله، تأكد أن الساعة متصلة حتى تستلم التحديث.',
  ),
  _FaqItem(
    'كم تدوم البطارية، وكيف أشحن الساعة؟',
    'يدوم شحن الساعة حوالي ٥ ساعات، ويقل مع تشغيل الاستماع لفترة طويلة. لشحن الساعة، وصّل كابل الشحن بالمنفذ الموجود في الجهة اليمنى منها. '
        'تظهر نسبة البطارية في صفحة «الساعة» في التطبيق وعلى شاشة الساعة، '
        'ويصلك تنبيه عندما تصل البطارية إلى ٢٠٪ ثم ١٠٪.',
  ),
  _FaqItem(
    'لماذا لم تتفعّل المجموعة عند وصولي إلى الموقع؟',
    'تأكد أنك سمحت للتطبيق بالوصول إلى موقعك، وأن الاستماع مشغّل. '
        'إذا كان نطاق المكان صغيرًا، جرّب تكبيره. '
        'يتحقق نبيه من موقعك كل دقيقة تقريبًا، لذلك قد يتأخر التفعيل قليلًا.',
  ),
  _FaqItem(
    'لماذا لا يظهر إشعار المنبه على الجوال؟',
    'تأكد أنك سمحت لنبيه بالإشعارات، وبإذن «المنبهات والتذكيرات» من إعدادات الجوال.',
  ),
];

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  /// رقم السؤال المفتوح حاليًا (null = كل الأسئلة مقفلة).
  /// سؤال واحد بس يكون مفتوح بنفس الوقت: فتح سؤال يقفل اللي قبله.
  int? _openIndex;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFDDEEF8), Color(0xFFF2F9FE), Colors.white],
              stops: [0.0, 0.35, 0.6],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 10, 24, 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // بوكس لغة الإشارة (نفس شكل صفحة التواصل)
                        const SignLanguageVideoBox(
                          videoAsset: 'assets/videos/sign_faq.mp4',
                        ),
                        for (var i = 0; i < _kFaqItems.length; i++) ...[
                          _FaqCard(
                            item: _kFaqItems[i],
                            isOpen: _openIndex == i,
                            // الضغط على سؤال مفتوح يقفله، والضغط على سؤال ثاني يفتحه ويقفل الأول
                            onTap: () => setState(
                              () => _openIndex = _openIndex == i ? null : i,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 64, bottom: 20, right: 20, left: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.15),
                border: Border.all(color: const Color(0xFF181059), width: 1.5),
              ),
              child: const Directionality(
                textDirection: TextDirection.ltr,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF181059),
                  size: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'الأسئلة الشائعة',
              style: TextStyle(
                fontFamily: 'IBMPlexSansArabic',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF181059),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SignLanguageToggleButton(),
        ],
      ),
    );
  }
}

/// بطاقة سؤال: الصفحة هي اللي تحدد إذا كانت مفتوحة (عشان يكون سؤال واحد بس مفتوح)
class _FaqCard extends StatelessWidget {
  final _FaqItem item;
  final bool isOpen;
  final VoidCallback onTap;
  const _FaqCard({required this.item, required this.isOpen, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isOpen ? const Color(0xFF181059) : NabeehColors.slate200,
            width: 1.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(
                    LucideIcons.helpCircle,
                    color: Color(0xFF181059),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.question,
                    style: const TextStyle(
                      fontFamily: 'IBMPlexSansArabic',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF181059),
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedRotation(
                  turns: isOpen ? 0.5 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: NabeehColors.slate500,
                  ),
                ),
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: isOpen
                  ? Padding(
                      padding: const EdgeInsets.only(top: 12, right: 32),
                      child: Text(
                        item.answer,
                        style: const TextStyle(
                          fontFamily: 'IBMPlexSansArabic',
                          fontSize: 14,
                          color: NabeehColors.slate700,
                          height: 1.7,
                        ),
                      ),
                    )
                  : const SizedBox(width: double.infinity),
            ),
          ],
        ),
      ),
    );
  }
}