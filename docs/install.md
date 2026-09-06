# تثبيت سند

سند مشغلتين: مهارات تُركّب من رابط، وقانون مشروع يعيش داخل التطبيق.

```text
your-app/
├── AGENTS.md                 ← قانون هذا المشروع (لا يجي من رابط السكيل)
├── HANDOFF.md                ← ذاكرة بين الوكلاء (لا يجي من رابط السكيل)
├── .claude/skills/           ← أو .cursor/skills أو .grok/skills أو .codex/skills
│   ├── fable/
│   └── app-security-gate/
└── ...كود التطبيق
```

## المهارات من رابط (الأسرع)

من جذر مشروعك:

```bash
npx add-skill F-alsanea/sanad
```

أو:

```bash
npx add-skill https://github.com/F-alsanea/sanad
```

الأمر ينسخ `skills/fable` و`skills/app-security-gate` لمجلد أداتك. لا يضع `AGENTS.md` ولا `HANDOFF.md`.

إذا كان المشروع فيه قانون خاص أصلاً (مثل chaar-hub): ركّب المهارات فقط. لا تستبدل `AGENTS.md`.

## قانون المشروع — ملف داخل الجذر

1. إن لم يوجد `AGENTS.md`: انسخ `templates/AGENTS.md` (نسخة إنجليزي كاملة) أو الجذر `AGENTS.md` إلى جذر التطبيق.
2. انسخ `templates/HANDOFF.md` إلى الجذر باسم `HANDOFF.md` واملأه لهذا المشروع.
3. عدّل في AGENTS فقط ما يخص هذا التطبيق. لا تلصق FABLE فيه.
4. لا تستخدم ملفاً اسمه `AGENTS-template.md`. القانون الآلي إنجليزي فقط.

هذان الملفان لا يُستبدلان برابط سكيل. هما ذاكرة هذا المشروع بين Claude وCursor وGrok وCodex.

## نسخ يدوي (بدون npx)

```bash
git clone https://github.com/F-alsanea/sanad.git
cp sanad/templates/AGENTS.md /path/to/your-app/AGENTS.md
cp sanad/templates/HANDOFF.md /path/to/your-app/HANDOFF.md
mkdir -p /path/to/your-app/.claude/skills
cp -R sanad/skills/fable sanad/skills/app-security-gate /path/to/your-app/.claude/skills/
```

## مسارات الأدوات

- Claude Code: `.claude/skills` أو `~/.claude/skills`
- Cursor: `.cursor/skills`
- Grok: `.grok/skills`
- Codex: `.codex/skills` أو `skills/` مع `AGENTS.md` في الجذر
- Copilot: `.github/skills/`

إن لم تعرف المسار: ضع `AGENTS.md` و`HANDOFF.md` في الجذر. هذا وحده يشغّل القانون.

اسم مجلد السكيل = حقل `name` في YAML. لا تغيّره.

## ليس كونكتور

لا تفترض زر Connect Sanad في Claude أو Cursor أو Codex أو Copilot.

- سند = مهارات من `https://github.com/F-alsanea/sanad` + قانون في جذر التطبيق
- ربط GitHub = إعداد الأداة نفسها (فتح مجلد، أو Connect GitHub في Codex)
- صلاحيات الكتابة على المستودع تجي من الأداة، لا من سند
- لا تربط Neon ولا R2 ولا Redis بالوكيل. أسرار بيئة فقط

## أول جلسة

```
اقرأ HANDOFF.md ثم AGENTS.md وابدأ.
لا تعتمد على الشات السابق.
لا تعدّل حتى أقول نفّذ.
```

`FABLE.md` اختياري في جذر التطبيق. السكيل `fable` يبحث عنه عند الحاجة.

مسح `scan-secrets.sh` قراءة فقط: لا ينتظر `نفّذ`. تدوير المفاتيح والكتابة ينتظران `نفّذ`.

## التحقق

```bash
npx skills-ref validate ./skills/fable
npx skills-ref validate ./skills/app-security-gate
```

## أمان الحزمة

`scan-secrets.sh` يطبع مساراً وسطراً ونصاً مختزلاً. لا قيم أسرار في التقرير ولا في أمثلة سند.
