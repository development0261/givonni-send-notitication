<script type="module">
    // Import the functions you need from the SDKs you need
    import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.10/firebase-app.js";
    import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.6.10/firebase-analytics.js";
    // TODO: Add SDKs for Firebase products that you want to use
    // https://firebase.google.com/docs/web/setup#available-libraries

    // Your web app's Firebase configuration
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional
    const firebaseConfig = {
        apiKey: "AIzaSyAqOQZv6O7pbD7l9rQJTBmJalJwOtp3u2Y",
        authDomain: "php-test-1b549.firebaseapp.com",
        projectId: "php-test-1b549",
        storageBucket: "php-test-1b549.appspot.com",
        messagingSenderId: "1005586131801",
        appId: "1:1005586131801:web:8680a011e0a0ecb3367a48",
        measurementId: "G-1SGFVPBVM9"
    };

    // Initialize Firebase
    const app = initializeApp(firebaseConfig);
    const analytics = getAnalytics(app);
</script>