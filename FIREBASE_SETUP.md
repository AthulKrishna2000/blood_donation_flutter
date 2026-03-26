# Firebase Setup Instructions

## Deploy Firestore Security Rules

The app requires Firestore security rules to be deployed to allow users to save their profiles. Follow these steps:

### 1. Install Firebase CLI
```bash
npm install -g firebase-tools
```

### 2. Login to Firebase
```bash
firebase login
```

### 3. Initialize/Connect to your Firebase project
```bash
firebase use --add
```
Select your existing Firebase project or create a new one.

### 4. Deploy Firestore Rules
```bash
firebase deploy --only firestore:rules
```

## Alternative: Firebase Console

You can also set the security rules directly in the Firebase Console:

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Select your project
3. Go to Firestore Database → Rules
4. Replace the default rules with:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can read and write their own user documents
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }

    // Allow reading all users for donor search functionality
    match /users/{userId} {
      allow read: if request.auth != null;
    }
  }
}
```

5. Click "Publish"

## Testing

After deploying the rules, try saving your profile again. The permission denied error should be resolved.