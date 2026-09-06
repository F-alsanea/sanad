# تثبيت سند

الوكيل الذي يفتح مستودع تطبيقك يجب أن يرى `AGENTS.md` أولاً، ثم يسحب طبقة واحدة من الدستور.

```text
your-app/
├── AGENTS.md
├── .claude/skills/          ← أو .cursor/skills أو .grok/skills
│   ├── fable/
│   └── app-security-gate/
└── ...كود التطبيق
```

1. انسخ `templates/AGENTS.md` إلى جذر التطبيق باسم `AGENTS.md`.
2. عدّل في AGENTS فقط ما يخص هذا التطبيق: لغة، استضافة، نطاق. لا تلصق الدستور فيه.
3. انسخ `skills/fable` و `skills/app-security-gate` إلى مجلد مهارات أداتك.
4. أول جلسة: `اقرأ AGENTS.md وابدأ.`

`FABLE.md` اختياري في جذر التطبيق. إن لم تنسخه، السكيل `fable` يبحث عنه في جذر الحزمة.

## مسارات الأدوات

- Claude Code: `.claude/skills/*/SKILL.md` داخل المشروع أو `~/.claude/skills`
- Cursor: `.cursor/skills`
- Grok: `.grok/skills`
- Codex: `AGENTS.md` في الجذر، والمهارات تحت `skills/`

إن لم تعرف المسار: ضع `AGENTS.md` في الجذر. هذا وحده يشغّل القانون.

## التحقق

اسم المجلد = `name` في الواجهة YAML.
`description` سطر واحد بلا اقتباس وبلا `: `.

```bash
npx skills-ref validate ./skills/fable
npx skills-ref validate ./skills/app-security-gate
```

## أمان الحزمة نفسها

`skills/app-security-gate/scripts/scan-secrets.sh` يطبع مساراً وسطراً ونصاً مختزلاً. لا يضع قيم الأسرار في التقرير.
لا تضع مفاتيح حقيقية في أمثلة سند.
