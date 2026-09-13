// ---------- waitlist forms → Supabase (insert-only table for the public key, see early_birds.sql) ----------
// Markup per form:
//   <form class="early" data-early data-source="hero" novalidate>
//     <input class="hp" type="text" name="company" tabindex="-1" autocomplete="off" aria-hidden="true">
//     <label class="sr" for="email-hero">Work email</label>
//     <input id="email-hero" type="email" placeholder="you@studio.com" autocomplete="email">
//     <button class="btn btn-primary" type="submit"><Action label></button>
//   </form>
//   <p class="early-note" data-early-note aria-live="polite" hidden></p>
// CSS: .hp{position:absolute;left:-10000px;width:1px;height:1px;opacity:0;pointer-events:none}
//      .early-note.ok{color:var(--ok-text)} .early-note.err{color:var(--stop-text)}
(function () {
  var API = 'https://<project-ref>.supabase.co/rest/v1/<table>';
  var KEY = '<sb_publishable_...>';
  var STORE = '<product>-early-bird';
  var EMAIL = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;
  // Match these to the page's action name and promise.
  var OK = 'You’re on the list. We’ll email you when your access is ready.';
  var DUP = 'You’re already on the list. We’ll be in touch.';
  var DONE_LABEL = 'You’re in';
  var forms = [].slice.call(document.querySelectorAll('form[data-early]'));

  function note(f, text, kind) {
    var n = f.nextElementSibling;
    if (!n || !n.hasAttribute('data-early-note')) return;
    n.hidden = false;
    n.textContent = text;
    n.classList.toggle('ok', kind === 'ok');
    n.classList.toggle('err', kind === 'err');
  }
  function joined(text) {
    forms.forEach(function (f) {
      f.querySelector('input[type="email"]').readOnly = true;
      var btn = f.querySelector('button');
      btn.disabled = true;
      btn.textContent = DONE_LABEL;
      f.classList.add('done');
      note(f, text, 'ok');
    });
    try { localStorage.setItem(STORE, '1'); } catch (e) {}
  }
  try { if (localStorage.getItem(STORE) === '1') joined(OK); } catch (e) {}

  forms.forEach(function (f) {
    f.addEventListener('submit', function (e) {
      e.preventDefault();
      if (f.classList.contains('done') || f.classList.contains('busy')) return;
      var input = f.querySelector('input[type="email"]'), btn = f.querySelector('button');
      var label = btn.dataset.label || (btn.dataset.label = btn.textContent);
      var email = input.value.trim().toLowerCase();
      if (!EMAIL.test(email) || email.length > 254) { note(f, 'Enter a valid email, like you@studio.com.', 'err'); input.focus(); return; }
      if (f.querySelector('.hp').value) { joined(OK); return; }
      f.classList.add('busy'); btn.disabled = true; btn.textContent = 'Sending…';
      fetch(API, {
        method: 'POST',
        headers: { apikey: KEY, 'Content-Type': 'application/json', Prefer: 'return=minimal' },
        body: JSON.stringify({
          email: email,
          source: f.dataset.source || 'landing',
          page: location.pathname.slice(0, 200),
          referrer: (document.referrer || '').slice(0, 500) || null,
          user_agent: (navigator.userAgent || '').slice(0, 400) || null
        })
      }).then(function (res) {
        f.classList.remove('busy');
        if (res.ok) return joined(OK);
        if (res.status === 409) return joined(DUP);
        throw new Error('HTTP ' + res.status);
      }).catch(function () {
        f.classList.remove('busy'); btn.disabled = false; btn.textContent = label;
        note(f, 'Couldn’t save your email. Check your connection and try again.', 'err');
      });
    });
  });

  // nav CTA scrolls to the nearest form
  document.querySelectorAll('a[href="#early"]').forEach(function (a) {
    a.addEventListener('click', function (e) {
      if (!forms.length) return;
      e.preventDefault();
      var mid = window.innerHeight / 2, best = forms[0], dist = Infinity;
      forms.forEach(function (f) { var r = f.getBoundingClientRect(), d = Math.abs(r.top + r.height / 2 - mid); if (d < dist) { dist = d; best = f; } });
      var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
      best.scrollIntoView({ behavior: reduce ? 'auto' : 'smooth', block: 'center' });
      var input = best.querySelector('input[type="email"]');
      if (input && !input.readOnly) setTimeout(function () { input.focus({ preventScroll: true }); }, reduce ? 0 : 500);
    });
  });
})();
