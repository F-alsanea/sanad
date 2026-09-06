<p align="center">
  <img src="https://github.com/F-alsanea.png" width="96" height="96" alt="Faisal Alsanea" style="border-radius:50%" />
</p>

# سند / Sanad

نظام تشغيل لوكلاء البرمجة، من [فيصل السني](https://github.com/F-alsanea).  
An operating system for coding agents, by [Faisal Alsanea](https://github.com/F-alsanea).

ليس برومبت يُلصق في الشات. ثلاثة طبقات، كل واحدة لها شغل.
It is not a prompt you paste into chat. Three layers, each with one job.

```
You
  →  AGENTS.md     قانون هذا المشروع / project law
  →  HANDOFF.md    ذاكرة بين الوكلاء / shared state across agents
  →  FABLE.md      دستور المهندس — طبقة واحدة فقط / one layer
  →  skills/       بوابات متخصصة — الأمن أولاً / specialized gates
```

**سند** اسم الأداة. **FABLE** اسم الدستور الداخلي. **AGENTS** قانون المشروع. **HANDOFF** ذاكرة الوكلاء.  
**Sanad** is the tool. **FABLE** is the engineering constitution. **AGENTS** is project law. **HANDOFF** is agent memory.

**لغة الملفات / File language**  
ملفات الوكيل بالإنجليزي. الشرح للبشر عربي أولاً. أمر الموافقة `نفّذ`.  
Agent files are English. Human docs are Arabic first. Approval token is `نفّذ`.

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

### Why Sanad

An agent speeds up building. Without law it also speeds up damage. It waits for `نفّذ`, does not claim “done” without evidence, and treats security as fail-closed.

### Install — skills from a URL, law from a file

Skills install from GitHub. Project law and the handoff stay as two files inside your app so any agent can continue from the same point.

```bash
# 1) Skills — from your app root
npx add-skill F-alsanea/sanad
```

```bash
# 2) Law and memory — two files in the app root
# If the project already has its own AGENTS.md, do not overwrite it
cp templates/AGENTS.md /path/to/your-app/AGENTS.md
cp templates/HANDOFF.md /path/to/your-app/HANDOFF.md
```

Without npx: `git clone`, then copy `skills/fable` and `skills/app-security-gate` into your tool’s skills folder.

| Tool | Skills folder |
|---|---|
| Claude Code | `.claude/skills/` |
| Cursor | `.cursor/skills/` |
| Grok | `.grok/skills/` |
| Codex | `.codex/skills/` or `skills/` |
| Copilot | `.github/skills/` |

### Claude, Cursor, Codex, and Copilot

Sanad is not a GitHub App and not a connector inside these tools. Each tool connects GitHub for its own account. Sanad is installed as skills in the tool folder plus two files in your app root: `AGENTS.md` and `HANDOFF.md`.

| Tool | Where Sanad lives | GitHub access (separate from Sanad) |
|---|---|---|
| Claude Code | `.claude/skills/` | Open the project folder in Claude Code |
| Cursor | `.cursor/skills/` | Settings → GitHub, or open the folder |
| Codex | `.codex/skills/` or `skills/` + reads `AGENTS.md` from the root | Connect GitHub from ChatGPT / the Codex app |
| Copilot | `.github/skills/` | Copilot enabled on the repository |
| Grok | `.grok/skills/` | GitHub connector on the account |

First message to any agent:

```
Read HANDOFF.md then AGENTS.md and start.
Do not edit until I say نفّذ.
```

If the tool does not see the skill: `Use the app-security-gate skill from skills/`

Do not connect Neon, R2, or Redis to the tool. Those are environment secrets, not part of Sanad.

Details: [`docs/install.md`](docs/install.md)

Security prompt: [`skills/app-security-gate/assets/user-prompt-ar.md`](skills/app-security-gate/assets/user-prompt-ar.md)

### Do not

- Do not merge AGENTS into FABLE or the reverse
- Do not overwrite an existing project `AGENTS.md` with the generic Sanad template
- Do not say “secure” unless all seven gates are `PASS` with evidence
- Do not assume a Connect Sanad button exists in Claude, Cursor, or Codex

---

<p align="left">
  <img src="https://github.com/F-alsanea.png" width="40" height="40" alt="Faisal Alsanea" />
  &nbsp; MIT. Built by <a href="https://github.com/F-alsanea">Faisal Alsanea</a>
  · <a href="https://x.com/thsfaisal">@thsfaisal</a>
</p>
