---
name: fable
description: Sanad engineering loader for AI agents. Use when starting a session, designing architecture, writing or reviewing code, touching UI, public pages, auth, data, or security. Load only the FABLE layer the current task needs. Triggers include سند, Sanad, FABLE, AGENTS.md, Layer S, Diagnostic Matrix, نفّذ, fail-closed.
license: MIT
metadata:
  version: "2.3.0"
  type: workflow
  source: FABLE.md
---

# FABLE — محرّك المهندس

هذا السكيل لا يبتلع الدستور كاملاً. الدستور في جذر المستودع: `FABLE.md`.
قانون المشروع في جذر مشروع المستخدم: `AGENTS.md`.

إن وُجد الاثنان: AGENTS يفوز في النطاق والمراحل وانتظار `نفّذ` والبنية المؤجلة.
FABLE يفوز في fail-closed وصفر placeholders والدليل قبل «تم» واقرأ-قبل-اكتب.

## عند تفعيل الجلسة

1. اقرأ `AGENTS.md` إن وُجد.
2. افحص المستودع بلا تعديل.
3. صنّف NEW أو EXISTING.
4. اكتب خريطة الجلسة. سطر FABLE يحدد الطبقة المفتوحة فقط.
5. لا تكتب كوداً قبل `نفّذ` إلا إذا أمر المستخدم بالتنفيذ صراحة في نفس الرسالة.

## أي طبقة تُفتح

| المهمة | اقرأ من FABLE.md |
|---|---|
| نص / لون / class | الجوهر فقط. لا Layer S. لا مصفوفة كاملة |
| سلوك محلي في قائم | Layer R خفيف |
| UI / RTL | Section 2 |
| صفحة عامة قابلة للفهرسة | Section 3 |
| API / بيانات / أدمن / أسرار | Section 5.2 + سكيل `app-security-gate` |
| مشروع جديد أو تغيير معماري | Layer S (الخريطة 12 سطحاً) قبل أي كود |
| حذف / migration / دفع | Tier 3 + موافقة تسمي الأثر |

فتح أكثر من الجدول = هدر سياق. ترك مشروع جديد بلا Layer S = مخالفة.

## جوهر لا يُطفأ

- اقرأ الملف قبل تعديله.
- لا كود ناقص ولا TODO في مسار إنتاج.
- لا «تم» بلا أثر (ملف:سطر أو مخرج أمر).
- أمن الصلاحيات والبيانات fail-closed حتى لو الاستضافة مؤجلة.
- الصرامة على قدر الخطر.

## أين الملفات

- الدستور الكامل: `../../FABLE.md` إن كان هذا السكيل داخل حزمة `sanad`، وإلا ابحث عن `FABLE.md` في جذر المشروع.
- التشغيل: `../../ARCHITECTURE.md`
- قالب قانون المشروع: `../../templates/AGENTS.md`
- بوابة الأمن: `../app-security-gate/SKILL.md`

لا تلصق FABLE في الشات. اقرأ القسم المطلوب فقط.
