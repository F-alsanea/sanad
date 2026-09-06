---
name: app-security-gate
description: Fail-closed security audit and hardening for apps. Use when the user asks to hide API keys, strip secrets from git history, expose only the public database key, enable row-level security, encrypt sensitive data, enforce server-side auth, secure logs, or run a pre-ship security review. Triggers include أمان, اختراق, RLS, secrets, API keys, security audit, تحقق من الأمان, hardening.
license: MIT
metadata:
  version: "1.0.0"
  type: workflow
  fable_layer: Security
  risk_tier: "3"
---

# App Security Gate

بوابة أمنية fail-closed قبل الشحن. لا تثق بواجهة مخفية ولا بمفتاح «مخفي في الفرونت». لا تطبع قيمة سر أبداً.

FABLE Layer: Security (Section 5.2). Risk tier: 3.
إن وُجد `AGENTS.md`: تقرير ثم انتظار `نفّذ`. لا تلمس ملفاً قبل الموافقة إلا إذا أمر المستخدم بالتنفيذ صراحة في نفس الرسالة.

اقرأ عند الحاجة:
- `references/gates.md` — إجراءات البوابات السبع + توسيع الهجوم
- `references/stack-adapters.md` — أين تبحث حسب الإطار
- `assets/report-template.md` — شكل التقرير
- `scripts/scan-secrets.sh` — مسح أنماط أسرار بلا طباعة القيم

## قواعد مطلقة

1. **لا تطبع سراً.** مسار + نوع + أسطر فقط.
2. **لا تعدّل قبل التقرير** إلا بأمر `نفّذ` صريح.
3. **لا تخفف حكماً.** وجود مكتبة auth ليس مصادقة.
4. **العميل غير موثوق.** أي قرار مال أو دور أو ملكية صف يُعاد على الخادم.
5. **Fail-closed.** جلسة ناقصة = رفض.
6. **لا تختر مزود بنية** إن كانت مؤجلة في AGENTS.
7. **Git history ليس working tree.** افحص الاثنين.
8. **المفتاح العام فقط في العميل:** anon / publishable. `service_role` في عميل = Critical.

## البوابات السبع

G1 مفاتيح API | G2 أسرار Git | G3 مفتاح DB العام فقط | G4 RLS | G5 تشفير | G6 مصادقة خادم | G7 سجلات.

التفاصيل في `references/gates.md`. التقرير في `assets/report-template.md`.

لا تقل «آمن» إلا إذا البوابات السبع PASS بدليل.
