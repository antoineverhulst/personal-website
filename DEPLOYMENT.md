# Deployment Guide - Clever Cloud

This guide will help you deploy your Hugo website to Clever Cloud.

## Prerequisites

1. **Clever Cloud Account**: Sign up at [https://console.clever-cloud.com](https://console.clever-cloud.com)
2. **Clever Cloud CLI** (Optional but recommended):
   ```bash
   npm install -g clever-cloud
   ```
3. **Git Repository**: Your code is already on GitHub at `git@github.com:antoineverhulst/personal-website.git`

## Configuration Files

The following files have been created for Clever Cloud deployment:

- `clevercloud/static.json` - Static hosting configuration with caching rules
- `clevercloud/hugo.json` - Hugo version specification (v0.152.2 extended)
- `clevercloud/build.sh` - Build script to install Hugo and build the site

## Deployment Steps

### Option 1: Deploy via Clever Cloud Console (Recommended for first deployment)

1. **Login to Clever Cloud Console**
   - Go to [https://console.clever-cloud.com](https://console.clever-cloud.com)
   - Sign in with your account

2. **Create a New Application**
   - Click "Create" → "An application"
   - Choose your organization
   - Select **"Static"** as the application type
   - Choose **"GitHub"** as the deployment method
   - Authorize Clever Cloud to access your GitHub account
   - Select the repository: `antoineverhulst/personal-website`
   - Select branch: `main` (or your preferred branch)

3. **Configure the Application**
   - **Name**: `antoine-verhulst-website` (or your preferred name)
   - **Region**: Choose closest to your target audience (e.g., PAR for Paris)
   - **Instance size**: Nano should be sufficient for a static site

4. **Set Environment Variables**
   In the application's "Environment Variables" section, add:
   ```
   CC_WEBROOT=/public
   HUGO_VERSION=0.152.2
   HUGO_ENV=production
   ```

5. **Configure Build**
   - **Build command**: `./clevercloud/build.sh`
   - **Static files folder**: `/public`

6. **Add Domain (Optional)**
   - In the "Domain names" section, add your custom domain: `antoineverhulst.com`
   - Configure DNS:
     - Add a CNAME record pointing to the Clever Cloud domain provided
     - Or add A records pointing to Clever Cloud IPs

7. **Deploy**
   - Click "Deploy" or push to your GitHub repository
   - Clever Cloud will automatically build and deploy

### Option 2: Deploy via CLI

1. **Login to Clever Cloud**
   ```bash
   clever login
   ```

2. **Create Application**
   ```bash
   clever create --type static antoine-verhulst-website
   ```

3. **Set Environment Variables**
   ```bash
   clever env set CC_WEBROOT /public
   clever env set HUGO_VERSION 0.152.2
   clever env set HUGO_ENV production
   ```

4. **Link to Git Repository**
   ```bash
   clever link app_YOUR_APP_ID
   ```

5. **Deploy**
   ```bash
   git push clever main
   ```

## Testing Locally Before Deployment

Always test your build locally before deploying:

```bash
# Clean previous build
rm -rf public/

# Build the site
hugo --minify --gc

# Serve locally to test
cd public && python3 -m http.server 8080
```

Then visit `http://localhost:8080` to verify everything works.

## Troubleshooting

### Build Fails

1. **Check Hugo Version**: Ensure `clevercloud/hugo.json` matches your local Hugo version
   ```bash
   hugo version
   ```

2. **Check Build Logs**:
   - In Clever Cloud console, go to your app → "Logs"
   - Look for errors in the build process

3. **Test Build Script Locally**:
   ```bash
   ./clevercloud/build.sh
   ```

### Site Not Displaying Correctly

1. **Check Base URL**: In `config.toml`, ensure `baseURL` is set correctly:
   ```toml
   baseURL = "https://antoineverhulst.com/"
   ```

2. **Check Static Files Path**: Verify `CC_WEBROOT=/public` is set in environment variables

3. **Check Cache**: Clear browser cache or use incognito mode

### Custom Domain Not Working

1. **DNS Propagation**: Wait 24-48 hours for DNS changes to propagate
2. **Check DNS Records**: Use `dig antoineverhulst.com` to verify DNS configuration
3. **SSL Certificate**: Clever Cloud automatically provisions SSL; this may take a few minutes

## Post-Deployment

### Continuous Deployment

Once set up, any push to your `main` branch will automatically trigger a new deployment:

```bash
git add .
git commit -m "Update content"
git push origin main
```

### Monitoring

- **Logs**: View real-time logs in Clever Cloud console
- **Metrics**: Monitor traffic and performance in the "Metrics" tab
- **Alerts**: Set up alerts for downtime or errors

## Updating Your Site

1. Make changes locally
2. Test with `hugo server`
3. Commit changes: `git commit -am "Your message"`
4. Push to GitHub: `git push origin main`
5. Clever Cloud will automatically rebuild and deploy

## Additional Resources

- [Clever Cloud Static Documentation](https://www.clever-cloud.com/doc/applications/static/)
- [Hugo Documentation](https://gohugo.io/documentation/)
- [Your GitHub Repository](https://github.com/antoineverhulst/personal-website)

## Support

- Clever Cloud Support: [https://www.clever-cloud.com/support/](https://www.clever-cloud.com/support/)
- Hugo Community: [https://discourse.gohugo.io/](https://discourse.gohugo.io/)

---

**Website Configuration:**
- **Hugo Version**: 0.152.2 (extended)
- **Theme**: antoine-verhulst (custom)
- **Primary Domain**: antoineverhulst.com
- **Repository**: github.com/antoineverhulst/personal-website
