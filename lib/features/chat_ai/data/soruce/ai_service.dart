class LocalChatBotService {

  Future<String> getReply(String message) async {

    final msg = message.toLowerCase();

    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (
    msg.contains('كسل') ||
        msg.contains('مش قادر') ||
        msg.contains('تعبان')
    ) {

      final replies = [

        'قوم ابدأ بس 🔥\nأول 10 دقايق هما الأصعب 💪',

        'مفيش حد جامد بيتمرن وهو عنده طاقة 😅🔥',

        'انزل الجيم وهتدعيلّي بعد التمرين 💪',

        'أقوى معركة هى إنك تقوم دلوقتى 🔥',
      ];

      replies.shuffle();

      return replies.first;
    }

    if (
    msg.contains('صدر')
    ) {

      final replies = [

        '''
تمرين الصدر النهاردة 🔥

- Bench Press
- Incline Dumbbell
- Chest Fly
''',

        '''
جرب تزود التحكم فى الحركة 💪
مش الوزن بس.
''',

        '''
ابدأ بالتمرين المركب الأول 🔥
وبعدين العزل.
''',
      ];

      replies.shuffle();

      return replies.first;
    }

    if (
    msg.contains('رجل') ||
        msg.contains('سكوات')
    ) {

      final replies = [

        'متنساش يوم الرجل 😅🔥',

        'السكوات ملك التمارين 💪',

        'يوم الرجل بيبنى جسم كامل 🔥',

        'وجع الرجل النهاردة = نتائج بكرة 😅',
      ];

      replies.shuffle();

      return replies.first;
    }

    if (
    msg.contains('دايت') ||
        msg.contains('اكل') ||
        msg.contains('تغذية')
    ) {

      final replies = [

        '''
ركز على:
🍗 بروتين
🥗 خضار
🍚 كارب نظيف
''',

        'الأكل أهم من التمرين أحيانًا 👀🔥',

        'ابعد عن السكر والمقليات 💪',

        'قسم أكلك على وجبات صغيرة 🔥',
      ];

      replies.shuffle();

      return replies.first;
    }

    if (
    msg.contains('مياه')
    ) {

      final replies = [

        'اشرب 3 لتر مياه يوميًا 💧',

        'قلة المياه = طاقة أقل 😅',

        'المياه مهمة للعضل والحرق 🔥',
      ];

      replies.shuffle();

      return replies.first;
    }

    if (
    msg.contains('ضخامه') ||
        msg.contains('زيادة وزن')
    ) {

      final replies = [

        '''
كل أكتر 🔥

🍚 كارب
🍗 بروتين
''',

        'متخافش من الأكل النضيف 💪',

        'زود سعراتك تدريجى 🔥',

        'الضخامة محتاجة صبر وأكل 😅',
      ];

      replies.shuffle();

      return replies.first;
    }

    if (
    msg.contains('تخسيس') ||
        msg.contains('دهون') ||
        msg.contains('كرش')
    ) {

      final replies = [

        '''
العجز السعرى 🔥
+ كارديو
= حرق دهون 💪
''',

        'المشى اليومى هيفرق جدًا 🔥',

        'الثبات أهم من الدايت القاسى 💪',

        'متوزنش نفسك كل يوم 😅',
      ];

      replies.shuffle();

      return replies.first;
    }

    if (
    msg.contains('بروتين')
    ) {

      final replies = [

        'البروتين مهم لبناء العضل 💪',

        'حاول تدخل بروتين فى كل وجبة 🔥',

        'بيض - فراخ - تونة 🔥',

        'بعد التمرين جسمك محتاج بروتين 😅',
      ];

      replies.shuffle();

      return replies.first;
    }

    if (
    msg.contains('كارديو')
    ) {

      final replies = [

        '20 دقيقة كارديو كفاية جدًا 🔥',

        'الكارديو بيقوى النفس ويحرق دهون 💪',

        'امشى بعد التمرين هيفرق جدًا 😅',
      ];

      replies.shuffle();

      return replies.first;
    }

    if (
    msg.contains('باى') ||
        msg.contains('ذراع')
    ) {

      final replies = [

        'ركز على الـ Curl بالتحكم 🔥',

        'الذراع بيكبر مع التمرين المركب 💪',

        'متلعبش وزن أعلى من تحكمك 😅',
      ];

      replies.shuffle();

      return replies.first;
    }

    if (
    msg.contains('ظهر')
    ) {

      final replies = [

        'الظهر العريض بيغير شكل الجسم 🔥',

        'ركز على السحب الصح 💪',

        'العقلة من أقوى تمارين الظهر 😅',
      ];

      replies.shuffle();

      return replies.first;
    }

    if (
    msg.contains('سلام') ||
        msg.contains('هاي')
    ) {

      return 'إزيك يا بطل 💪🔥';
    }

    return '''
كمّل يا وحش 🔥💪

قولى:
- تمرين
- تخسيس
- ضخامه
- دايت
- تحفيز
''';
  }
}