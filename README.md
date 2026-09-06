<p align="center">
  <img src="https://github.com/F-alsanea.png" width="96" height="96" alt="Faisal Alsanea" style="border-radius:50%" />
</p>

# سند / Sanad

نظام تشغيل لوكلاء البرمجة، من [فيصل السني](https://github.com/F-alsanea).  
An operating system for coding agents, by [Faisal Alsanea](https://github.com/F-alsanea).

ليس برومبت يُلصق في الشات. ثلاثة طبقات، كل واحدة لها شغل.

```
You
  →  AGENTS.md     قانون هذا المشروع / project law
  →  HANDOFF.md    ذاكرة بين الوكلاء / shared state across agents
  →  FABLE.md      دستور المهندس — طبقة واحدة فقط / one layer
  →  skills/       بوابات متخصصة — الأمن أولاً / specialized gates
```

**سند** اسم الأداة. **FABLE** اسم الدستور الداخلي. **AGENTS** قانون المشروع. **HANDOFF** ذاكرة الوكلاء.

**لغة الملفات / File language**  
ملفات الوكيل بالإنجليزي. الشرح للبشر عربي أولاً. أمر الموافقة `نفّذ`.

---

## العربية

### لماذا سند

الوكيل يسرّع البناء. من غير قانون يسرّع التخريب أيضاً. ينتظر `نفّذ`، ولا يدّعي «تم» بلا دليل، والأمن fail-closed.

### تثبيت — مهارات من رابط، قانون من ملف

المهارات تُركّب من GitHub. قانون المشروع والـ handoff يبقون ملفين داخل تطبيقك عشان يكمّل أي وكيل من نفس النقطة.

```bash
# 1) المهارات — من جذر مشروعك
npx add-skill F-alsanea/sanad
```

```bash
# 2) القانون والذاكرة — ملفان في جذر التطبيق
# إن ما كان عندك AGENTS.md خاص بالمشروع، لا تستبدله
cp templates/AGENTS.md /path/to/your-app/AGENTS.md
cp templates/HANDOFF.md /path/to/your-app/HANDOFF.md
```

بدون npx: `git clone` ثم انسخ `skills/fable` و`skills/app-security-gate` إلى مجلد أداتك.

| الأداة | مجلد المهارات |
|---|---|
| Claude Code | `.claude/skills/` |
| Cursor | `.cursor/skills/` |
| Grok | `.grok/skills/` |
| Codex | `.codex/skills/` أو `skills/` |
| Copilot | `.github/skills/` |

### Claude و Cursor و Codex و Copilot

سند ليس GitHub App وليس كونكتور داخل هذه الأدوات. كل أداة تربط GitHub لحسابها. سند يُركّب كمهارات في مجلد الأداة + `ملفين` في جذر مشروعك: `AGENTS.md` و`HANDOFF.md`.

| الأداة | أين يعيش سند | ربط GitHub (منفصل عن سند) |
|---|---|---|
| Claude Code | `.claude/skills/` | افتح مجلد المشروع في Claude Code |
| Cursor | `.cursor/skills/` | Settings → GitHub، أو افتح المجلد |
| Codex | `.codex/skills/` أو `skills/` + يقرأ `AGENTS.md` من الجذر | Connect GitHub من ChatGPT / تطبيق Codex |
| Copilot | `.github/skills/` | Copilot مفعّل على المستودع |
| Grok | `.grok/skills/` | كونكتور GitHub في الحساب |

أول رسالة لأي وكيل:

```
اقرأ HANDOFF.md ثم AGENTS.md وابدأ.
لا تعدّل حتى أقول نفّذ.
```

إذا الأداة ما شافت المهارة: `استخدم المهارة app-security-gate من skills/`

لا تربط Neon أو R2 أو Redis بالأداة. هذي أسرار بيئة، ليست جزءاً من سند.

التفاصيل: [`docs/install.md`](docs/install.md)

برومبت أمني: [`skills/app-security-gate/assets/user-prompt-ar.md`](skills/app-security-gate/assets/user-prompt-ar.md)

### لا تفعل

- لا تدمج AGENTS داخل FABLE ولا العكس
- لا تستبدل `AGENTS.md` قائم في المشروع بقالب سند العام
- لا تقول «آمن» إلا إذا البوابات السبع `PASS` بدليل
- لا تفترض وجود زر Connect Sanad في Claude أو Cursor أو Codex

---

## English

Skills install from the repo URL. Project law does not.

```bash
npx add-skill F-alsanea/sanad
```

Then copy `templates/AGENTS.md` and `templates/HANDOFF.md` into the app root **only if** the app has no project law yet. Do not overwrite a repo-specific `AGENTS.md`.

`npx add-skill` places `fable` and `app-security-gate`. It does not create `AGENTS.md` or `HANDOFF.md`. Those files are how Claude, Cursor, Grok, and Codex share state.

Sanad is not a GitHub App and not a connector inside those tools. Each tool connects GitHub on its own. Sanad is skills in the tool folder plus `AGENTS.md` and `HANDOFF.md` in the app root.

| Tool | Where Sanad lives | GitHub access (not Sanad) |
|---|---|---|
| Claude Code | `.claude/skills/` | Open the project folder |
| Cursor | `.cursor/skills/` | Settings → GitHub, or open the folder |
| Codex | `.codex/skills/` or `skills/` | Connect GitHub in ChatGPT / Codex |
| Copilot | `.github/skills/` | Copilot enabled on the repo |
| Grok | `.grok/skills/` | GitHub connector on the account |

First message: `Read HANDOFF.md then AGENTS.md and start. Do not edit until I say نفّذ.`

If the tool misses the skill: `Use the app-security-gate skill from skills/`.

Do not connect Neon, R2, or Redis to the agent. Those are runtime secrets, not Sanad.

Details: [`docs/install.md`](docs/install.md)

---

<p align="left">
  <img src="https://github.com/F-alsanea.png" width="40" height="40" alt="Faisal Alsanea" />
  &nbsp; MIT. Built by <a href="https://github.com/F-alsanea">Faisal Alsanea</a>
  · <a href="https://x.com/thsfaisal">@thsfaisal</a>
</p>
