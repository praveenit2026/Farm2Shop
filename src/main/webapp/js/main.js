// =============================================
// Farm 2 Shop — Main JavaScript
// Tamil / English i18n system
// =============================================

var translations = {
    en: {
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
        // Hero / Landing
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
        'features.f3desc': 'End-to-end encrypted, backed by Supabase PostgreSQL. Full audit trail of every transaction.',
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
        // Register placeholders
        'reg.fullname.ph': 'e.g. Ravi Kumar',
        'reg.farmname.ph': 'e.g. Green Fields Farm',
        'reg.ownername.ph': 'e.g. Jerry Thomas',
        'reg.shopname.ph': 'e.g. Jerry Retail Store',
        'reg.phone.ph': 'e.g. 9886764849',
        'reg.location.ph': 'e.g. Trichy, Chennai',
        'reg.password.ph': 'Create a strong password',
        // Farmer Dashboard
        'fd.welcome': 'Welcome Back, ',
        'fd.subtitle': 'Manage your farm and check orders from shopkeepers.',
        'fd.manage.title': 'Add / Manage Crops',
        'fd.manage.desc': 'List your fresh crops, update pricing, update quantity, and delete stale listings.',
        'fd.manage.btn': 'My Crop Listings',
        'fd.orders.title': 'Incoming Orders',
        'fd.orders.desc': 'View purchase orders placed by shopkeepers. Process orders to Shipped/Delivered state.',
        'fd.orders.btn': 'Manage Orders',
        'stat.crops': 'Active Crops Listed',
        'stat.pendingorders': 'Pending Orders',
        'stat.earnings': 'Total Earnings',
        // Shopkeeper Dashboard
        'sd.welcome': 'Welcome Back, Owner of ',
        'sd.subtitle': 'Browse crop listings directly from farmers, and check your orders.',
        'stat.ordered': 'Crops Ordered',
        'sd.procure.title': 'Procure Fresh Crops',
        'sd.procure.desc': 'Browse local listings, filter by categories, compare farmer prices, and place direct bookings.',
        'sd.procure.btn': 'Browse Marketplace',
        'sd.bookings.title': 'Manage Bookings',
        'sd.bookings.desc': 'Review your orders, pay online for pending orders, and track your active delivery status.',
        'sd.bookings.btn': 'My Bookings',
        // Farmer crops pages
        'farmer.crops.title': 'My Crop Listings',
        'farmer.crops.sub': 'Manage and list fresh farm produce for shopkeepers to buy.',
        'farmer.crops.add': '+ Add New Crop',
        'farmer.nocrops': 'No crops listed yet',
        'farmer.nocrops.desc': 'Click "+ Add New Crop" to publish your first produce listing.',
        'farmer.listproduce': 'List New Produce',
        'farmer.cropname': 'Crop / Product Name',
        'farmer.cropname.ph': 'e.g. Red Apples, Organic Tomatoes',
        'farmer.category': 'Category',
        'farmer.location': 'Farming Location',
        'farmer.quantity': 'Quantity (in kg)',
        'farmer.quantity.ph': 'e.g. 100',
        'farmer.price': 'Price (per kg)',
        'farmer.price.ph': 'e.g. 2.50',
        'farmer.cropimage': 'Crop Image',
        // Farmer orders/bookings
        'farmer.orders.title': 'Purchase Orders',
        'farmer.orders.sub': 'Manage crop orders placed by retail shopkeepers.',
        'farmer.noorders': 'No purchase orders received yet.',
        'order.noactions': 'No actions available',
        // Farmer payments
        'farmer.pay.title': 'My Payments Received',
        'farmer.pay.sub': 'Track payments for fulfilled orders.',
        'farmer.nopayments': 'No payments recorded yet. Fulfill orders to receive payments.',
        // Farmer complaints
        'farmer.complaint.title': 'My Support Complaints',
        'farmer.complaint.sub': 'Submit concerns directly to the System Administrator.',
        'comp.history': 'Complaint History',
        'comp.awaiting': 'Awaiting admin response...',
        'comp.nocomplaints': 'No complaints filed. Thank you for your cooperation!',
        'comp.new': 'File New Complaint',
        'comp.subject.label': 'Subject',
        'comp.subject.ph': 'e.g. Payment Issue, App Bug',
        'comp.message.label': 'Detailed Message',
        'comp.message.ph': 'Describe your concern...',
        'btn.submitdispute': 'Submit Dispute',
        // Shopkeeper products
        'shop.market.title': 'Farm Marketplace',
        'shop.market.sub': 'Procure fresh crops directly from local farmers.',
        'btn.dashboard': 'Dashboard',
        'shop.search.ph': 'Search crop names or categories...',
        'btn.search': 'Search Marketplace',
        'btn.ordercrop': 'Order Crop',
        'btn.outofstock': 'Out of Stock',
        'shop.nocrops': 'No crops found',
        'shop.nocrops.sub': 'Try searching for a different keyword or category.',
        // Shopkeeper booking modal
        'shop.modal.title': 'Configure Crop Order',
        'shop.modal.qty': 'Required Quantity (in kg)',
        'shop.modal.warn': 'Quantity exceeds available stock!',
        'shop.modal.total': 'Total Outlay:',
        // Shopkeeper bookings
        'shop.bookings.title': 'My Purchase Bookings',
        'shop.bookings.sub': 'Manage payments and track delivery progress of your crops.',
        'alert.payment.success': 'Payment received! Your order is being processed by the farmer.',
        'alert.payment.fail': 'Transaction declined. Please check details and try again.',
        'btn.paynow': 'Pay Now',
        'lbl.fullypaid': '✓ Fully Paid',
        'shop.nobookings': 'No bookings found. Visit the marketplace to order crops.',
        // Shopkeeper payment / checkout
        'pay.checkout': 'Order Checkout',
        'pay.summary': 'Purchase Summary',
        'pay.card.radio': 'Credit / Debit Card',
        'pay.cod.radio': 'Cash on Delivery (COD)',
        'pay.cardholder': 'Cardholder Name',
        'pay.cardholder.ph': 'e.g. Jerry Smith',
        'pay.cardnumber': 'Card Number',
        'pay.cardnumber.ph': 'e.g. 1111222233334444',
        'pay.expiry': 'Expiry Date',
        'pay.cvv': 'CVV',
        'btn.processpay': 'Process Checkout',
        // Categories
        'cat.all': 'All Categories',
        'cat.fruits': 'Fruits',
        'cat.vegetables': 'Vegetables',
        'cat.grains': 'Grains & Cereals',
        'cat.pulses': 'Pulses & Beans',
        'cat.other': 'Other',
        // Table Headers
        'th.orderid': 'Order ID',
        'th.shopkeeper': 'Shopkeeper Name',
        'th.cropcat': 'Crop / Category',
        'th.qty': 'Ordered Quantity',
        'th.rev': 'Total Revenue',
        'th.date': 'Ordered Date',
        'th.status': 'Current Status',
        'th.actions': 'Actions',
        'th.payid': 'Payment ID',
        'th.cropitem': 'Crop Item',
        'th.paymethod': 'Payment Method',
        'th.amountrec': 'Amount Received',
        'th.paydate': 'Payment Date',
        'th.txstatus': 'Transaction Status',
        'th.id': 'ID',
        'th.subject': 'Subject',
        'th.message': 'Message Details',
        'th.datefiled': 'Date Filed',
        'th.adminresp': 'Admin Response',
        'th.bookingid': 'Booking ID',
        'th.farmername': 'Farmer Name',
        'th.cropordered': 'Crop ordered',
        'th.bookingdate': 'Booking Date',
        'th.progress': 'Order Progress',
        'th.payaction': 'Payment Action',
        // Labels
        'lbl.category': 'Category:',
        'lbl.stock': 'Stock:',
        'lbl.farmer': 'Farmer:',
        'lbl.location': 'Location:',
        'lbl.crop': 'Crop:',
        'lbl.price': 'Price:',
        // Common Buttons
        'btn.back': 'Back',
        'btn.approve': 'Approve',
        'btn.reject': 'Reject',
        'btn.ship': 'Ship Order',
        'btn.deliver': 'Deliver Order',
        'btn.publish': 'Publish Listing',
        'btn.book': 'Book Crop',
        'btn.submit': 'Submit Complaint',
        'btn.pay': 'Make Payment',
        'btn.confirm': 'Confirm Order',
        'btn.remove': 'Remove Listing',
        // Statuses
        'status.Pending': 'Pending',
        'status.Approved': 'Approved',
        'status.Success': 'Approved',
        'status.Shipped': 'Shipped',
        'status.Delivered': 'Delivered',
        'status.Rejected': 'Rejected',
        'status.Solved': 'Solved',
        // Payment methods
        'pay.Card': 'Card',
        'pay.COD': 'COD',
        'pay.UPI': 'UPI',
        'pay.Cash': 'Cash',
        'pay.Net Banking': 'Net Banking',
    },
    ta: {
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
        // Hero / Landing
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
        'stats.commission': 'தரகு கட்டணம் இல்லை',
        'stats.access': 'எப்போதும் சந்தை',
        'stats.trade': 'நேரடி வணிகம்',
        'cta.title': 'உங்கள் வணிகத்தை மாற்ற தயாரா?',
        'cta.sub': 'நூற்றுக்கணக்கான விவசாயிகளும் கடைக்காரர்களும் Farm 2 Shop பயன்படுத்துகிறார்கள்.',
        'cta.btn': 'இலவச கணக்கு உருவாக்கு',
        // Login
        'login.subtitle': 'உங்கள் கணக்கில் உள்நுழைவு',
        'login.signas': 'நீங்கள் யார்?',
        'login.farmer': 'விவசாயி',
        'login.shopkeeper': 'கடைக்காரர்',
        'login.admin': 'நிர்வாகி',
        'login.email.label': 'பயனர் பெயர் / மின்னஞ்சல்',
        'login.email.ph': 'மின்னஞ்சல் உள்ளிடவும்',
        'login.pass.label': 'கடவுச்சொல்',
        'login.pass.ph': 'கடவுச்சொல் உள்ளிடவும்',
        'login.btn': 'உள்நுழைவு →',
        'login.noacc': 'கணக்கு இல்லையா?',
        'login.create': 'இலவசமாக உருவாக்கு',
        // Register
        'reg.subtitle': 'இலவச கணக்கு உருவாக்கு',
        'reg.iama': 'நான் ஒரு',
        'reg.fullname': 'முழு பெயர்',
        'reg.farmname': 'பண்ணை / அமைப்பின் பெயர்',
        'reg.ownername': 'உரிமையாளர் பெயர்',
        'reg.shopname': 'கடை பெயர்',
        'reg.email': 'மின்னஞ்சல் முகவரி',
        'reg.phone': 'தொலைபேசி எண்',
        'reg.location': 'இடம் / நகரம்',
        'reg.password': 'கடவுச்சொல்',
        'reg.btn': 'கணக்கு உருவாக்கு →',
        'reg.haveacc': 'ஏற்கனவே கணக்கு உள்ளதா?',
        'reg.signin': 'உள்நுழைவு',
        // Register placeholders
        'reg.fullname.ph': 'எ.கா. ரவி குமார்',
        'reg.farmname.ph': 'எ.கா. பசுமை பண்ணை',
        'reg.ownername.ph': 'எ.கா. ஜெர்ரி தாமஸ்',
        'reg.shopname.ph': 'எ.கா. ஜெர்ரி சில்லறை கடை',
        'reg.phone.ph': 'எ.கா. 9886764849',
        'reg.location.ph': 'எ.கா. திருச்சி, சென்னை',
        'reg.password.ph': 'வலுவான கடவுச்சொல்லை உருவாக்கு',
        // Farmer Dashboard
        'fd.welcome': 'மீண்டும் வருக, ',
        'fd.subtitle': 'உங்கள் பண்ணையை நிர்வகித்து, கடைக்காரர்களின் ஆர்டர்களைச் சரிபார்க்கவும்.',
        'fd.manage.title': 'பயிர்கள் சேர் / நிர்வகி',
        'fd.manage.desc': 'உங்கள் புதிய பயிர்களை பட்டியலிடுங்கள், விலை, அளவு புதுப்பிக்கவும், மற்றும் பழைய பட்டியல்களை நீக்கவும்.',
        'fd.manage.btn': 'என் பயிர் பட்டியல்',
        'fd.orders.title': 'வரும் ஆர்டர்கள்',
        'fd.orders.desc': 'கடைக்காரர்கள் வழங்கிய ஆர்டர்களை பாருங்கள். ஆர்டர்களை Shipped/Delivered நிலைக்கு செயலாக்கவும்.',
        'fd.orders.btn': 'ஆர்டர்கள் நிர்வகி',
        'stat.crops': 'செயலில் உள்ள பயிர்கள்',
        'stat.pendingorders': 'நிலுவை ஆர்டர்கள்',
        'stat.earnings': 'மொத்த வருமானம்',
        // Shopkeeper Dashboard
        'sd.welcome': 'மீண்டும் வருக, கடை உரிமையாளர் ',
        'sd.subtitle': 'விவசாயிகளிடமிருந்து நேரடியாக பயிர் பட்டியல்களை உலாவி, உங்கள் ஆர்டர்களைச் சரிபார்க்கவும்.',
        'stat.ordered': 'ஆர்டர் செய்யப்பட்ட பயிர்கள்',
        'sd.procure.title': 'புதிய பயிர்களை வாங்குதல்',
        'sd.procure.desc': 'உள்ளூர் பட்டியல்களை உலாவவும், வகைகளின்படி வடிகட்டவும், விவசாயி விலைகளை ஒப்பிட்டு நேரடியாக முன்பதிவு செய்யவும்.',
        'sd.procure.btn': 'சந்தையை உலாவு',
        'sd.bookings.title': 'முன்பதிவுகளை நிர்வகி',
        'sd.bookings.desc': 'உங்கள் ஆர்டர்களை மதிப்பாய்வு செய்யவும், நிலுவையில் உள்ள ஆர்டர்களுக்கு ஆன்லைனில் பணம் செலுத்தவும், விநியோக நிலையை கண்காணிக்கவும்.',
        'sd.bookings.btn': 'என் முன்பதிவுகள்',
        // Farmer crops pages
        'farmer.crops.title': 'என் பயிர் பட்டியல்',
        'farmer.crops.sub': 'கடைக்காரர்கள் வாங்குவதற்காக பண்ணை விளைபொருட்களைப் பட்டியலிடவும்.',
        'farmer.crops.add': '+ புதிய பயிர் சேர்',
        'farmer.nocrops': 'பயிர்கள் எதுவும் இன்னும் பட்டியலிடப்படவில்லை',
        'farmer.nocrops.desc': 'உங்களது முதல் பயிர் பட்டியலை வெளியிட "+ புதிய பயிர் சேர்" என்பதை கிளிக் செய்யவும்.',
        'farmer.listproduce': 'புதிய தயாரிப்பை பட்டியலிடு',
        'farmer.cropname': 'பயிர் / தயாரிப்பு பெயர்',
        'farmer.cropname.ph': 'எ.கா. தக்காளி, வெங்காயம்',
        'farmer.category': 'வகை',
        'farmer.location': 'விவசாய இடம்',
        'farmer.quantity': 'அளவு (கிலோவில்)',
        'farmer.quantity.ph': 'எ.கா. 100',
        'farmer.price': 'விலை (ஒரு கிலோவுக்கு)',
        'farmer.price.ph': 'எ.கா. 2.50',
        'farmer.cropimage': 'பயிர் படம்',
        // Farmer orders/bookings
        'farmer.orders.title': 'கொள்முதல் ஆர்டர்கள்',
        'farmer.orders.sub': 'கடைக்காரர்கள் வழங்கிய பயிர் ஆர்டர்களை நிர்வகிக்கவும்.',
        'farmer.noorders': 'கொள்முதல் ஆர்டர்கள் எதுவும் இன்னும் வரவில்லை.',
        'order.noactions': 'செயல்கள் எதுவும் இல்லை',
        // Farmer payments
        'farmer.pay.title': 'என் பெற்ற கொடுப்பனவுகள்',
        'farmer.pay.sub': 'நிறைவேற்றப்பட்ட ஆர்டர்களுக்கான கொடுப்பனவுகளைக் கண்காணிக்கவும்.',
        'farmer.nopayments': 'கொடுப்பனவுகள் எதுவும் இன்னும் பதிவு செய்யப்படவில்லை. பணம் பெற ஆர்டர்களை நிறைவேற்றவும்.',
        // Farmer complaints
        'farmer.complaint.title': 'என் ஆதரவு புகார்கள்',
        'farmer.complaint.sub': 'கவலைகளை கணினி நிர்வாகியிடம் நேரடியாக சமர்ப்பிக்கவும்.',
        'comp.history': 'புகார் வரலாறு',
        'comp.awaiting': 'நிர்வாகியின் பதிலுக்காக காத்திருக்கிறது...',
        'comp.nocomplaints': 'புகார்கள் எதுவும் தாக்கல் செய்யப்படவில்லை. உங்கள் ஒத்துழைப்புக்கு நன்றி!',
        'comp.new': 'புதிய புகாரை தாக்கல் செய்',
        'comp.subject.label': 'தலைப்பு',
        'comp.subject.ph': 'எ.கா. கட்டண சிக்கல், பயன்பாட்டு பிழை',
        'comp.message.label': 'விரிவான செய்தி',
        'comp.message.ph': 'உங்கள் கவலையை விவரிக்கவும்...',
        'btn.submitdispute': 'புகாரை சமர்ப்பி',
        // Shopkeeper products
        'shop.market.title': 'விவசாய சந்தை',
        'shop.market.sub': 'உள்ளூர் விவசாயிகளிடமிருந்து நேரடியாக புதிய பயிர்களைப் பெறுங்கள்.',
        'btn.dashboard': 'டாஷ்போர்டு',
        'shop.search.ph': 'பயிர் பெயர்கள் அல்லது பிரிவுகளைத் தேடுங்கள்...',
        'btn.search': 'சந்தையைத் தேடு',
        'btn.ordercrop': 'ஆர்டர் பயிர்',
        'btn.outofstock': 'இருப்பு இல்லை',
        'shop.nocrops': 'பயிர்கள் எதுவும் காணப்படவில்லை',
        'shop.nocrops.sub': 'வேறு முக்கிய சொல் அல்லது பிரிவை தேட முயற்சிக்கவும்.',
        // Shopkeeper booking modal
        'shop.modal.title': 'பயிர் ஆர்டரை உள்ளமைக்கவும்',
        'shop.modal.qty': 'தேவைப்படும் அளவு (கிலோவில்)',
        'shop.modal.warn': 'அளவு கிடைக்கக்கூடிய இருப்பை விட அதிகமாக உள்ளது!',
        'shop.modal.total': 'மொத்த செலவு:',
        // Shopkeeper bookings
        'shop.bookings.title': 'என் கொள்முதல் முன்பதிவுகள்',
        'shop.bookings.sub': 'பணம் செலுத்துதலை நிர்வகிக்கவும் மற்றும் பயிர்களின் விநியோக நிலையை கண்காணிக்கவும்.',
        'alert.payment.success': 'பணம் பெறப்பட்டது! உங்கள் ஆர்டர் விவசாயியால் செயலாக்கப்படுகிறது.',
        'alert.payment.fail': 'பரிவர்த்தனை நிராகரிக்கப்பட்டது. விவரங்களைச் சரிபார்த்து மீண்டும் முயற்சிக்கவும்.',
        'btn.paynow': 'இப்போது செலுத்தவும்',
        'lbl.fullypaid': '✓ முழுமையாக செலுத்தப்பட்டது',
        'shop.nobookings': 'முன்பதிவுகள் எதுவும் காணப்படவில்லை. பயிர்களை ஆர்டர் செய்ய சந்தைக்குச் செல்லவும்.',
        // Shopkeeper payment / checkout
        'pay.checkout': 'ஆர்டர் செக்அவுட்',
        'pay.summary': 'கொள்முதல் சுருக்கம்',
        'pay.card.radio': 'கிரெடிட் / டெபிட் கார்டு',
        'pay.cod.radio': 'பணம் செலுத்திப் பெறுதல் (COD)',
        'pay.cardholder': 'அட்டைதாரர் பெயர்',
        'pay.cardholder.ph': 'எ.கா. ஜெர்ரி ஸ்மித்',
        'pay.cardnumber': 'அட்டை எண்',
        'pay.cardnumber.ph': 'எ.கா. 1111222233334444',
        'pay.expiry': 'காலாவதி தேதி',
        'pay.cvv': 'சிவிவி (CVV)',
        'btn.processpay': 'செக்அவுட் செயல்முறை',
        // Categories
        'cat.all': 'அனைத்து வகைகள்',
        'cat.fruits': 'பழங்கள்',
        'cat.vegetables': 'காய்கறிகள்',
        'cat.grains': 'தானியங்கள் & தானிய வகை',
        'cat.pulses': 'பருப்பு வகைகள்',
        'cat.other': 'மற்றவை',
        // Table Headers
        'th.orderid': 'ஆர்டர் ஐடி',
        'th.shopkeeper': 'கடைக்காரர் பெயர்',
        'th.cropcat': 'பயிர் / வகை',
        'th.qty': 'ஆர்டர் செய்த அளவு',
        'th.rev': 'மொத்த வருவாய்',
        'th.date': 'ஆர்டர் செய்த தேதி',
        'th.status': 'தற்போதைய நிலை',
        'th.actions': 'செயல்கள்',
        'th.payid': 'பரிவர்த்தனை ஐடி',
        'th.cropitem': 'பயிர் வகை',
        'th.paymethod': 'பணம் செலுத்தும் முறை',
        'th.amountrec': 'பெறப்பட்ட தொகை',
        'th.paydate': 'பணம் செலுத்திய தேதி',
        'th.txstatus': 'பரிவர்த்தனை நிலை',
        'th.id': 'ஐடி',
        'th.subject': 'தலைப்பு',
        'th.message': 'செய்தி விவரங்கள்',
        'th.datefiled': 'தேதி',
        'th.adminresp': 'நிர்வாகியின் பதில்',
        'th.bookingid': 'முன்பதிவு ஐடி',
        'th.farmername': 'விவசாயி பெயர்',
        'th.cropordered': 'ஆர்டர் செய்யப்பட்ட பயிர்',
        'th.bookingdate': 'முன்பதிவு தேதி',
        'th.progress': 'ஆர்டர் முன்னேற்றம்',
        'th.payaction': 'பணம் செலுத்தும் செயல்',
        // Labels
        'lbl.category': 'பிரிவு:',
        'lbl.stock': 'இருப்பு:',
        'lbl.farmer': 'விவசாயி:',
        'lbl.location': 'இடம்:',
        'lbl.crop': 'பயிர்:',
        'lbl.price': 'விலை:',
        // Common Buttons
        'btn.back': 'திரும்பு',
        'btn.approve': 'அனுமதி',
        'btn.reject': 'நிராகரி',
        'btn.ship': 'அனுப்பு',
        'btn.deliver': 'வழங்கு',
        'btn.publish': 'பட்டியலிடு',
        'btn.book': 'முன்பதிவு',
        'btn.submit': 'புகார் தெரிவி',
        'btn.pay': 'கட்டணம் செலுத்து',
        'btn.confirm': 'உறுதி செய்',
        'btn.remove': 'நீக்கு',
        // Statuses
        'status.Pending': 'நிலுவையில்',
        'status.Approved': 'அங்கீகரிக்கப்பட்டது',
        'status.Success': 'அங்கீகரிக்கப்பட்டது',
        'status.Shipped': 'அனுப்பப்பட்டது',
        'status.Delivered': 'வழங்கப்பட்டது',
        'status.Rejected': 'நிராகரிக்கப்பட்டது',
        'status.Solved': 'தீர்க்கப்பட்டது',
        // Payment methods
        'pay.Card': 'அட்டை',
        'pay.COD': 'COD',
        'pay.UPI': 'UPI',
        'pay.Cash': 'பணம்',
        'pay.Net Banking': 'இணைய வங்கி',
    }
};

var currentLang = localStorage.getItem('f2s_lang') || 'en';

function applyLanguage(lang) {
    currentLang = lang;
    localStorage.setItem('f2s_lang', lang);

    // Translate all data-i18n elements
    var elements = document.querySelectorAll('[data-i18n]');
    for (var i = 0; i < elements.length; i++) {
        var el = elements[i];
        var key = el.getAttribute('data-i18n');
        var val = translations[lang] && translations[lang][key];
        if (val) {
            if (el.getAttribute('data-i18n-attr') === 'placeholder') {
                el.placeholder = val;
            } else {
                el.textContent = val;
            }
        }
    }

    // Update toggle button label
    var btn = document.getElementById('langToggleBtn');
    if (btn) {
        if (lang === 'en') {
            btn.innerHTML = '<span>🇮🇳</span> தமிழ்';
        } else {
            btn.innerHTML = '<span>🇬🇧</span> English';
        }
    }

    document.documentElement.lang = lang === 'ta' ? 'ta' : 'en';
}

function toggleLanguage() {
    var next = currentLang === 'en' ? 'ta' : 'en';
    applyLanguage(next);
}

// ---- Run immediately (script is at bottom of page, DOM is ready) ----
applyLanguage(currentLang);

// ---- Alert auto-hide ----
var alertEls = document.querySelectorAll('.alert');
for (var a = 0; a < alertEls.length; a++) {
    (function(el) {
        setTimeout(function() {
            el.style.transition = 'opacity 0.5s, transform 0.5s';
            el.style.opacity = '0';
            el.style.transform = 'translateY(-10px)';
            setTimeout(function() { if (el.parentNode) el.parentNode.removeChild(el); }, 500);
        }, 5000);
    })(alertEls[a]);
}

// ---- Delete confirmation dialogs ----
var deleteBtns = document.querySelectorAll('.btn-delete-confirm');
for (var d = 0; d < deleteBtns.length; d++) {
    deleteBtns[d].addEventListener('click', function(e) {
        var msg = currentLang === 'ta'
            ? 'நீங்கள் உறுதியாக நீக்க விரும்புகிறீர்களா?'
            : 'Are you sure you want to delete this item?';
        if (!confirm(msg)) { e.preventDefault(); }
    });
}

// ---- Modal controls ----
function openModal(id) {
    var m = document.getElementById(id);
    if (m) m.classList.add('active');
}
function closeModal(id) {
    var m = document.getElementById(id);
    if (m) m.classList.remove('active');
}
