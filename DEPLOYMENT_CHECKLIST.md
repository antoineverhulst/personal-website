# Clever Cloud Deployment Checklist

## ✅ Pre-Deployment Setup (COMPLETED)

All the necessary configuration files have been created:

- [x] `clevercloud/static.json` - Static hosting configuration
- [x] `clevercloud/hugo.json` - Hugo version specification
- [x] `clevercloud/build.sh` - Build script (executable)
- [x] `DEPLOYMENT.md` - Complete deployment guide
- [x] Production build tested successfully (204ms, 31 pages)
- [x] Config.toml has correct baseURL: https://antoineverhulst.com/
- [x] .gitignore properly configured

## 📋 Next Steps - Deploy to Clever Cloud

### Step 1: Create Clever Cloud Account
1. Go to [https://console.clever-cloud.com](https://console.clever-cloud.com)
2. Sign up or login
3. Verify your email address

### Step 2: Create Application in Clever Cloud
1. Click **"Create"** → **"An application"**
2. Select your organization (or personal space)
3. Choose application type: **"Static"**
4. Select deployment: **"GitHub"**
5. Authorize Clever Cloud to access GitHub
6. Select repository: **antoineverhulst/personal-website**
7. Select branch: **main**

### Step 3: Configure Application
**Name your application:**
- Suggested name: `antoine-verhulst-website`

**Choose region:**
- Recommended: **PAR** (Paris) - closest to Europe
- Alternative: **MTL** (Montreal), **SGP** (Singapore)

**Select instance size:**
- **Nano** (Free tier) is sufficient for a static Hugo site

### Step 4: Set Environment Variables
In the "Environment Variables" tab, add:

```
CC_WEBROOT=/public
HUGO_VERSION=0.152.2
HUGO_ENV=production
```

### Step 5: Configure Build Settings
In the "Information" tab:
- **Build command**: Leave empty (we use build.sh)
- **Static folder**: `/public`

### Step 6: Deploy!
Click **"Deploy"** or simply push to GitHub:
```bash
git add .
git commit -m "Add Clever Cloud configuration"
git push origin main
```

Clever Cloud will automatically:
1. Clone your repository
2. Run `./clevercloud/build.sh`
3. Install Hugo 0.152.2 extended
4. Build your site with `hugo --minify --gc`
5. Serve the `/public` directory

### Step 7: Add Custom Domain (Optional)
1. In Clever Cloud console, go to **"Domain names"**
2. Add domain: `antoineverhulst.com`
3. Configure DNS at your registrar:
   - **CNAME** record: Point to Clever Cloud domain (provided in console)
   - Or **A** records: Use Clever Cloud IP addresses

**DNS Example:**
```
Type: CNAME
Name: @ (or www)
Value: app-xxx.cleverapps.io (from Clever Cloud console)
```

4. Wait for DNS propagation (up to 48 hours)
5. SSL certificate will be auto-provisioned by Clever Cloud

## 🧪 Testing After Deployment

Once deployed, verify:
- [ ] Homepage loads: https://your-app.cleverapps.io/
- [ ] All pages accessible: /experience/, /portfolio/, /articles/
- [ ] Images display correctly
- [ ] CSS styling works
- [ ] Links function properly
- [ ] Mobile responsiveness
- [ ] SSL certificate active (https)

## 🔄 Future Updates

After initial deployment, any updates are automatic:

```bash
# Make your changes
git add .
git commit -m "Update content"
git push origin main
```

Clever Cloud will automatically rebuild and redeploy (takes ~1-2 minutes).

## 📊 Monitoring

Access in Clever Cloud console:
- **Logs**: Real-time build and deployment logs
- **Metrics**: Traffic, bandwidth, requests
- **Alerts**: Set up notifications for errors

## ⚠️ Important Notes

1. **First deployment takes longer** (~2-5 minutes) as Hugo is installed
2. **Subsequent deployments are faster** (~30-60 seconds)
3. **Build logs** help troubleshoot any issues
4. **Free tier limitations**: Check Clever Cloud pricing for your needs

## 🆘 Troubleshooting

If deployment fails:
1. Check **Logs** in Clever Cloud console
2. Verify environment variables are set correctly
3. Test build locally: `./clevercloud/build.sh`
4. Review `DEPLOYMENT.md` for detailed troubleshooting

## 📞 Support Resources

- **Clever Cloud Docs**: https://www.clever-cloud.com/doc/applications/static/
- **Hugo Docs**: https://gohugo.io/documentation/
- **Your Deployment Guide**: See `DEPLOYMENT.md` for detailed instructions

---

## Quick Reference

**Your Configuration:**
- Hugo Version: 0.152.2 (extended)
- Theme: antoine-verhulst
- Primary Domain: antoineverhulst.com
- Repository: github.com/antoineverhulst/personal-website
- Branch: main

**Clever Cloud Settings:**
- App Type: Static
- Build Script: ./clevercloud/build.sh
- Static Folder: /public
- Environment: HUGO_ENV=production

**Build Command (runs automatically):**
```bash
hugo --minify --gc
```

---

✨ **Your website is ready to deploy!** Follow the steps above to go live.
