# Freebox Dashboard - Home Assistant Add-on (Wrapper)

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armv7 Architecture][armv7-shield]

## 🎯 À propos de cet add-on

Cet add-on est un **wrapper** qui télécharge et exécute automatiquement la dernière version du [Freebox Dashboard original](https://github.com/HgHugo/FreeboxOS-Ultra-Dashboard).

### Avantages de cette approche

✅ **Toujours à jour** - Utilise automatiquement la dernière version du projet original
✅ **Pas de fork à maintenir** - Aucune duplication de code à gérer
✅ **Mises à jour automatiques** - Option pour télécharger la dernière version à chaque démarrage
✅ **Code source non modifié** - Utilise directement le code du développeur original

## Fonctionnalités

Interface web complète pour gérer votre Freebox (Ultra, Delta, Pop) :

- 📊 Surveillance en temps réel de la bande passante
- 📡 Gestion WiFi (2.4GHz, 5GHz, 6GHz)
- 🔒 Configuration VPN (OpenVPN, PPTP, WireGuard)
- 📥 Gestionnaire de téléchargements (torrents)
- 📁 Explorateur de fichiers avec partage
- 📞 Journaux d'appels et contacts
- 📺 Guide TV et enregistrements
- 💻 Machines virtuelles (Ultra/Delta)
- 👨‍👩‍👧‍👦 Contrôle parental
- 🌐 Vue d'ensemble des appareils réseau
- 📈 Statistiques et analytiques système

## Installation

### 1. Ajouter le dépôt

1. Dans Home Assistant : **Paramètres** → **Modules complémentaires** → **Boutique**
2. Cliquez sur les **3 points** (⋮) → **Dépôts**
3. Ajoutez l'URL de ce dépôt :
   ```
   https://github.com/VOTRE-USERNAME/freebox-dashboard-addon
   ```
4. Cliquez sur **Ajouter**

### 2. Installer l'add-on

1. Recherchez **"Freebox Dashboard"** dans la boutique
2. Cliquez sur **Installer**
3. Attendez la fin de l'installation (5-10 minutes)

### 3. Configuration

```yaml
freebox_host: mafreebox.freebox.fr
log_level: info
update_on_start: true
```

#### Options

- **freebox_host** : Adresse de votre Freebox (défaut : `mafreebox.freebox.fr`)
- **log_level** : Niveau de logs (`debug`, `info`, `warning`, `error`)
- **update_on_start** : Télécharger la dernière version à chaque démarrage (défaut : `true`)

### 4. Première utilisation

1. Démarrez l'add-on
2. Cliquez sur **Ouvrir l'interface Web**
3. Autorisez l'application sur votre Freebox (flèche droite sur la façade)

## Comment ça marche ?

### Au build de l'add-on
1. Le Dockerfile clone la dernière version du dépôt original
2. Installe les dépendances
3. Build le frontend
4. Crée l'image Docker

### Au démarrage de l'add-on

**Si `update_on_start: true` (recommandé)** :
1. Clone la dernière version du dépôt original
2. Met à jour le code serveur et frontend
3. Rebuild le frontend si nécessaire
4. Démarre l'application

**Si `update_on_start: false`** :
1. Utilise la version installée lors du build
2. Démarre directement l'application

## Mise à jour

### Mise à jour automatique (recommandé)

Avec `update_on_start: true`, l'add-on se met à jour automatiquement à chaque redémarrage en téléchargeant la dernière version du dépôt original.

Pour forcer une mise à jour :
1. **Redémarrez** simplement l'add-on

### Mise à jour manuelle de l'image

Pour mettre à jour l'image Docker de l'add-on lui-même :

1. Allez dans la page de l'add-on
2. Cliquez sur **Reconstruire** (Rebuild)

## Avantages vs Fork

| Aspect | Fork classique | Wrapper (cet add-on) |
|--------|----------------|----------------------|
| Code source | Dupliqué et à maintenir | Toujours synchronisé avec l'original |
| Mises à jour | Merge manuel régulier | Automatique à chaque démarrage |
| Maintenance | Nécessite des commits | Aucune maintenance du code |
| Taille du dépôt | ~50 MB (code complet) | ~5 KB (juste la config) |
| Personnalisation | Possible | Limitée à la config |

## Compatibilité

- ✅ Freebox Ultra
- ✅ Freebox Delta
- ✅ Freebox Pop
- ✅ Freebox Revolution
- ✅ Autres modèles compatibles API Freebox

## Dépannage

### L'add-on ne démarre pas

Vérifiez les logs dans l'onglet **Journal** de l'add-on.

### La mise à jour automatique échoue

Si `update_on_start: true` cause des problèmes :
1. Passez `update_on_start: false` dans la configuration
2. Redémarrez l'add-on
3. Il utilisera la version installée lors du build

### Impossible de se connecter à la Freebox

1. Vérifiez que Home Assistant et la Freebox sont sur le même réseau
2. Testez l'accès : `ping mafreebox.freebox.fr`
3. Vérifiez que l'API Freebox est activée

## Crédits

- **Projet original** : [FreeboxOS Ultra Dashboard](https://github.com/HgHugo/FreeboxOS-Ultra-Dashboard) par [HgHugo](https://github.com/HgHugo)
- **Add-on wrapper** : Création de l'encapsulation Home Assistant
- **Design** : [@powl_d](https://x.com/powl_d)

## Support

- **Problèmes avec l'add-on wrapper** : Ouvrez une issue sur ce dépôt
- **Problèmes avec le dashboard** : [Issues du projet original](https://github.com/HgHugo/FreeboxOS-Ultra-Dashboard/issues)

## Licence

- Add-on wrapper : MIT
- Projet original : MIT

---

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
