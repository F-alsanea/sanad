# سند / Sanad

نظام تشغيل لوكلاء البرمجة، من فيصل الصانع.  
An operating system for coding agents, by Faisal Alsanea.

ليس برومبت يُلصق في الشات. ثلاثة طبقات، كل واحدة لها شغل.

```
You
  →  AGENTS.md     قانون هذا المشروع / project law
  →  FABLE.md      دستور المهندس — طبقة واحدة فقط / engineering standard, one layer
  →  skills/       بوابات متخصصة — الأمن أولاً / specialized gates, security first
```

**سند** اسم الأداة. **FABLE** اسم الدستور الداخلي. **AGENTS** قانون المشروع.

---

## العربية

### لماذا سند

الوكيل يسرّع البناء. من غير قانون يسرّع التخريب أيضاً.

سند يفرض على أي وكيل (Claude، Cursor، Codex، Copilot، Grok):

- يقرأ المشروع قبل ما يكتب
- يصنّف جديد أو قائم
- ينتظر `نفّذ` قبل الكود
- لا يدّعي «تم» بلا دليل
- الأمن fail-closed حتى لو الاستضافة مؤجلة

### المحتويات

| الملف | الوظيفة |
|---|---|
| `templates/AGENTS.md` | القانون المحلي — انسخه لجذر كل مشروع |
| `FABLE.md` | الدستور الكامل — لا يُحمَّل كله في كل رد |
| `ARCHITECTURE.md` | كيف تشتغل الطبقتان |
| `skills/fable` | سكيل قصير يفتح الطبقة المطلوبة فقط |
| `skills/app-security-gate` | بوابة قبل الشحن: المفاتيح، تاريخ Git، RLS، التشفير، مصادقة الخادم، السجلات |

### تثبيت

```bash
git clone https://github.com/F-alsanea/sanad.git

cp sanad/templates/AGENTS.md /path/to/your-app/AGENTS.md
mkdir -p /path/to/your-app/.claude/skills
cp -R sanad/skills/fable sanad/skills/app-security-gate /path/to/your-app/.claude/skills/
```

| الأداة | مجلد المهارات |
|---|---|
| Claude Code | `.claude/skills/` |
| Cursor | `.cursor/skills/` |
| Grok | `.grok/skills/` |
| Codex | `skills/` مع `AGENTS.md` في الجذر |
| Copilot | `.github/skills/` |

اسم مجلد السكيل = حقل `name` داخل `SKILL.md`. لا تغيّره.

أول جلسة:

```
اقرأ AGENTS.md وابدأ.
```

قبل الشحن أو عند API / أدمن / بيانات:

```
اقرأ سكيل app-security-gate ودقّق الأمان.
لا تعدّل حتى أقول نفّذ.
```

برومبت أمني جاهز: [`skills/app-security-gate/assets/user-prompt-ar.md`](skills/app-security-gate/assets/user-prompt-ar.md)

تفاصيل التثبيت: [`docs/install.md`](docs/install.md)

### لا تفعل

- لا تدمج AGENTS داخل FABLE ولا العكس
- لا تطلب من أحد يقرأ الدستور كاملاً
- لا تفتح خريطة معمارية عشان تغيّر لون
- لا تقول «التطبيق آمن» إلا إذا بوابات الأمن السبع `PASS` بدليل

---

## English

Sanad is a small operating system for coding agents. It is not a mega-prompt.

- `AGENTS.md` is the law of *this* repo: scope, phase order, wait for approval, deferred infra.
- `FABLE.md` is the engineering standard. Load only the layer the task needs.
- `app-security-gate` is a fail-closed pre-ship audit: hide API keys, purge secrets from git history, expose only the public database key, enable row-level security, encrypt sensitive data, enforce server-side auth, and keep secrets out of logs.

Compatible with the [Agent Skills](https://agentskills.io/specification) format. Works with Claude Code, Cursor, Codex, Copilot, Grok, and any agent that reads `SKILL.md`.

### Install

```bash
git clone https://github.com/F-alsanea/sanad.git
cp sanad/templates/AGENTS.md /path/to/your-app/AGENTS.md
cp -R sanad/skills/fable sanad/skills/app-security-gate /path/to/your-app/.claude/skills/
```

Then: `Read AGENTS.md and start.`  
Before ship: `Load app-security-gate and audit security. Do not edit until I say نفّذ.`

Do not merge AGENTS into FABLE. Do not claim the app is secure unless all seven security gates are `PASS` with evidence.

---

MIT. Built by [Faisal Alsanea](https://github.com/F-alsanea).
