// =============================================
// Farm 2 Shop — Main JavaScript
// Includes: Tamil/English translation system,
//           Modal controls, Alert auto-hide
// =============================================

// ---- Translation Dictionary ----
const translations = {
    en: {
        // Navbar
        'nav.signin': 'Sign In',
        'nav.getstarted': 'Get Started',
        'nav.dashboard': 'Dashboard',
        'nav.mycrops': 'My Crops',
        'nav.orders': 'Orders',
        'nav.payments': 'Payments',
        'nav.support': 'Support',
        'nav.logout': 'Logout',
        'nav.marketplace': 'Marketplace',
        'nav.myorders': 'My Orders',
        'nav.farmers': 'Farmers',
        'nav.shopkeepers': 'Shopkeepers',
        'nav.complaints': 'Complaints',
        'nav.sales': 'Sales',
        // Hero
        'hero.badge': '🌱 Farm-to-Shop B2B Platform',
        'hero.title': 'Direct Crops, No Middlemen.',
        'hero.subtitle': 'Connecting local farmers with shopkeepers for transparent, commission-free agricultural trade. Fresh produce, fair prices.',
        'hero.btn1': 'Start Trading →',
        'hero.btn2': 'Join as Partner',
        'features.why': 'Why Farm 2 Shop?',
        'features.title': 'Built for both sides of the chain',
        'features.f1title': 'For Farmers',
        'features.f1desc': 'List your fresh crops directly, set your own prices, manage orders, and receive payments — without commission losses or intermediaries.',
        'features.f2title': 'For Shopkeepers',
        'features.f2desc': 'Browse verified farm listings, compare prices, book crops online, pay securely, and track your deliveries in real-time.',
        'features.f3title': 'Secure & Transparent',
        'features.f3desc': 'End-to-end encrypted, backed by Supabase PostgreSQL. Full audit trail of every transaction, with admin mediation for disputes.',
        'stats.commission': 'Commission Fee',
        'stats.access': 'Marketplace Access',
        'stats.trade': 'Direct Trade',
        'cta.title': 'Ready to transform your trade?',
        'cta.sub': 'Join hundreds of farmers and shopkeepers already using Farm 2 Shop.',
        'cta.btn': 'Create Free Account',
        // Login
        'login.subtitle': 'Sign in to your account',
        'login.signas': 'Sign in as',
        'login.farmer': 'Farmer',
        'login.shopkeeper': 'Shopkeeper',
        'login.admin': 'Admin',
        'login.email.label': 'Username / Email',
        'login.email.ph': 'Enter username or email',
        'login.pass.label': 'Password',
        'login.pass.ph': 'Enter your password',
        'login.btn': 'Sign In →',
        'login.noacc': "Don't have an account?",
        'login.create': 'Create one free',
        // Register
        'reg.subtitle': 'Create your free partner account',
        'reg.iama': 'I am a',
        'reg.fullname': 'Full Name',
        'reg.farmname': 'Farm / Organization Name',
        'reg.ownername': 'Owner Name',
        'reg.shopname': 'Shop Name',
        'reg.email': 'Email Address',
        'reg.phone': 'Phone Number',
        'reg.location': 'Location / City',
        'reg.password': 'Password',
        'reg.btn': 'Create Account →',
        'reg.haveacc': 'Already have an account?',
        'reg.signin': 'Sign In',
        // Farmer pages
        'farmer.crops.title': 'My Crop Listings',
        'farmer.crops.sub': 'Manage and list fresh farm produce for shopkeepers to buy.',
        'farmer.crops.add': '+ Add New Crop',
        'farmer.orders.title': 'Purchase Orders',
        'farmer.orders.sub': 'Manage crop orders placed by retail shopkeepers.',
        'farmer.pay.title': 'My Payments Received',
        'farmer.pay.sub': 'Track payments for fulfilled orders.',
        'farmer.complaint.title': 'My Complaints',
        'farmer.complaint.sub': 'Submit and track issues with orders or shopkeepers.',
        // Shopkeeper pages
        'shop.market.title': 'Fresh Crop Marketplace',
        'shop.market.sub': 'Buy direct from farmers at best prices.',
        'shop.orders.title': 'My Bookings',
        'shop.orders.sub': 'Track your crop orders and delivery status.',
        'shop.complaint.title': 'My Complaints',
        'shop.pay.title': 'My Payments',
        // Common
        'btn.back': 'Back',
        'btn.approve': 'Approve',
        'btn.reject': 'Reject',
        'btn.ship': 'Ship Order',
        'btn.deliver': 'Deliver Order',
        'btn.publish': 'Publish Listing',
        'btn.book': 'Book Crop',
        'btn.submit': 'Submit Complaint',
        'btn.pay': 'Make Payment',
        'lbl.status': 'Status',
        'lbl.actions': 'Actions',
        'lbl.nodata': 'No records found.',
    },
    ta: {
        // Navbar
        'nav.signin': 'உள்நுழைவு',
        'nav.getstarted': 'தொடங்கு',
        'nav.dashboard': 'டாஷ்போர்டு',
        'nav.mycrops': 'என் பயிர்கள்',
        'nav.orders': 'ஆர்டர்கள்',
        'nav.payments': 'கொடுப்பனவுகள்',
        'nav.support': 'ஆதரவு',
        'nav.logout': 'வெளியேறு',
        'nav.marketplace': 'சந்தை',
        'nav.myorders': 'என் ஆர்டர்கள்',
        'nav.farmers': 'விவசாயிகள்',
        'nav.shopkeepers': 'கடைக்காரர்கள்',
        'nav.complaints': 'புகார்கள்',
        'nav.sales': 'விற்பனை',
        // Hero
        'hero.badge': '🌱 பண்ணை முதல் கடை வரை',
        'hero.title': 'நேரடி பயிர்கள், இடைத்தரகர் இல்லை.',
        'hero.subtitle': 'விவசாயிகளையும் கடைக்காரர்களையும் நேரடியாக இணைக்கிறோம். புதிய பொருட்கள், நியாயமான விலை.',
        'hero.btn1': 'வணிகம் தொடங்கு →',
        'hero.btn2': 'கூட்டாளியாக சேரு',
        'features.why': 'ஏன் Farm 2 Shop?',
        'features.title': 'இரு தரப்பினருக்கும் பயனளிக்கும்',
        'features.f1title': 'விவசாயிகளுக்கு',
        'features.f1desc': 'உங்கள் பயிர்களை நேரடியாக பட்டியலிடுங்கள், சொந்த விலை நிர்ணயிக்கவும், ஆர்டர்கள் நிர்வகிக்கவும் — தரகு இல்லாமல்.',
        'features.f2title': 'கடைக்காரர்களுக்கு',
        'features.f2desc': 'சரிபார்க்கப்பட்ட பண்ணை பட்டியல்களை உலாவுங்கள், விலைகளை ஒப்பிடுங்கள், ஆர்டர் செய்யுங்கள், விநியோகத்தை கண்காணிக்கவும்.',
        'features.f3title': 'பாதுகாப்பான & வெளிப்படையான',
        'features.f3desc': 'முழு குறியாக்கம், Supabase PostgreSQL ஆதரவு. ஒவ்வொரு பரிவர்த்தனையும் முழு தணிக்கை தடத்துடன்.',
        'stats.commission': 'தரகு கட்டணம்',
        'stats.access': 'சந்தை அணுகல்',
        'stats.trade': 'நேரடி வணிகம்',
        'cta.title': 'உங்கள் வணிகத்தை மாற்ற தயாரா?',
        'cta.sub': 'நூற்றுக்கணக்கான விவசாயிகளும் கடைக்காரர்களும் Farm 2 Shop பயன்படுத்துகிறார்கள்.',
        'cta.btn': 'இலவச கணக்கு உருவாக்கு',
        // Login
        'login.subtitle': 'உங்கள் கணக்கில் உள்நுழைவு',
        'login.signas': 'உள்நுழைய',
        'login.farmer': 'விவசாயி',
        'login.shopkeeper': 'கடைக்காரர்',
        'login.admin': 'நிர்வாகி',
        'login.email.label': 'பயனர்பெயர் / மின்னஞ்சல்',
        'login.email.ph': 'மின்னஞ்சல் உள்ளிடவும்',
        'login.pass.label': 'கடவுச்சொல்',
        'login.pass.ph': 'கடவுச்சொல் உள்ளிடவும்',
        'login.btn': 'உள்நுழைவு →',
        'login.noacc': 'கணக்கு இல்லையா?',
        'login.create': 'இலவசமாக உருவாக்கு',
        // Register
        'reg.subtitle': 'இலவச கணக்கு உருவாக்கு',
        'reg.iama': 'நான்',
        'reg.fullname': 'முழு பெயர்',
        'reg.farmname': 'பண்ணை / நிறுவன பெயர்',
        'reg.ownername': 'உரிமையாளர் பெயர்',
        'reg.shopname': 'கடை பெயர்',
        'reg.email': 'மின்னஞ்சல் முகவரி',
        'reg.phone': 'தொலைபேசி எண்',
        'reg.location': 'இடம் / நகரம்',
        'reg.password': 'கடவுச்சொல்',
        'reg.btn': 'கணக்கு உருவாக்கு →',
        'reg.haveacc': 'ஏற்கனவே கணக்கு உள்ளதா?',
        'reg.signin': 'உள்நுழைவு',
        // Farmer pages
        'farmer.crops.title': 'என் பயிர் பட்டியல்',
        'farmer.crops.sub': 'கடைக்காரர்களுக்கு பயிர்களை விற்க பட்டியலிடுங்கள்.',
        'farmer.crops.add': '+ புதிய பயிர் சேர்',
        'farmer.orders.title': 'கொள்முதல் ஆர்டர்கள்',
        'farmer.orders.sub': 'கடைக்காரர்கள் வழங்கிய ஆர்டர்களை நிர்வகிக்கவும்.',
        'farmer.pay.title': 'பெற்ற கொடுப்பனவுகள்',
        'farmer.pay.sub': 'நிறைவேற்றிய ஆர்டர்களுக்கான கட்டணங்களை கண்காணிக்கவும்.',
        'farmer.complaint.title': 'என் புகார்கள்',
        'farmer.complaint.sub': 'ஆர்டர் அல்லது கடைக்காரர் சிக்கல்களை புகாரளிக்கவும்.',
        // Shopkeeper pages
        'shop.market.title': 'புதிய பயிர் சந்தை',
        'shop.market.sub': 'விவசாயிகளிடம் நேரடியாக சிறந்த விலையில் வாங்குங்கள்.',
        'shop.orders.title': 'என் முன்பதிவுகள்',
        'shop.orders.sub': 'உங்கள் பயிர் ஆர்டர்கள் மற்றும் விநியோக நிலையை கண்காணிக்கவும்.',
        'shop.complaint.title': 'என் புகார்கள்',
        'shop.pay.title': 'என் கொடுப்பனவுகள்',
        // Common
        'btn.back': 'திரும்பு',
        'btn.approve': 'அனுமதி',
        'btn.reject': 'நிராகரி',
        'btn.ship': 'அனுப்பு',
        'btn.deliver': 'வழங்கு',
        'btn.publish': 'பட்டியலிடு',
        'btn.book': 'முன்பதிவு செய்',
        'btn.submit': 'புகார் தெரிவி',
        'btn.pay': 'கட்டணம் செலுத்து',
        'lbl.status': 'நிலை',
        'lbl.actions': 'செயல்கள்',
        'lbl.nodata': 'தரவு எதுவும் இல்லை.',
    }
};

// ---- Language Functions ----
var currentLang = localStorage.getItem('f2s_lang') || 'en';

function applyLanguage(lang) {
    currentLang = lang;
    localStorage.setItem('f2s_lang', lang);

    // Update all data-i18n elements
    document.querySelectorAll('[data-i18n]').forEach(function(el) {
        var key = el.getAttribute('data-i18n');
        if (translations[lang] && translations[lang][key]) {
            // Handle placeholder vs text content
            if (el.getAttribute('data-i18n-attr') === 'placeholder') {
                el.placeholder = translations[lang][key];
            } else {
                el.textContent = translations[lang][key];
            }
        }
    });

    // Update toggle button label
    var btn = document.getElementById('langToggleBtn');
    if (btn) {
        btn.innerHTML = lang === 'en'
            ? '<span style="font-size:1rem;">🇮🇳</span> தமிழ்'
            : '<span style="font-size:1rem;">🇬🇧</span> English';
    }

    // Set html lang attribute
    document.documentElement.lang = lang === 'ta' ? 'ta' : 'en';
}

function toggleLanguage() {
    applyLanguage(currentLang === 'en' ? 'ta' : 'en');
}

// ---- DOMContentLoaded ----
document.addEventListener("DOMContentLoaded", function() {

    // Apply saved language on load
    applyLanguage(currentLang);

    // Alert auto-hide
    const alerts = document.querySelectorAll(".alert");
    alerts.forEach(function(alert) {
        setTimeout(function() {
            alert.style.opacity = '0';
            alert.style.transform = 'translateY(-10px)';
            alert.style.transition = 'all 0.5s ease';
            setTimeout(function() { alert.remove(); }, 500);
        }, 5000);
    });

    // Confirmation dialogs for delete
    const deleteButtons = document.querySelectorAll(".btn-delete-confirm");
    deleteButtons.forEach(function(button) {
        button.addEventListener("click", function(event) {
            var msg = currentLang === 'ta'
                ? 'நீங்கள் உறுதியாக நீக்க விரும்புகிறீர்களா? இந்த செயலை மீட்டெடுக்க முடியாது.'
                : 'Are you sure you want to delete this item? This action cannot be undone.';
            if (!confirm(msg)) {
                event.preventDefault();
            }
        });
    });
});

// Modal controls
function openModal(modalId) {
    var modal = document.getElementById(modalId);
    if (modal) modal.classList.add("active");
}

function closeModal(modalId) {
    var modal = document.getElementById(modalId);
    if (modal) modal.classList.remove("active");
}
