# Homebrew Tap: Trader Workstation (Stable)

A custom Homebrew tap for installing the **Stable** version of Interactive Brokers' Trader Workstation (TWS) on macOS.

## Usage & Installation

First, add this tap to your local Homebrew installation:

```bash
brew tap delight/trader-workstation
```

Then, trust the tap:

```bash
brew trust delight/trader-workstation
```

Alternatively, you can trust the cask directly:

```bash
brew trust --cask delight/trader-workstation/trader-workstation@stable
```

Then, install the stable version of Trader Workstation:

```bash
brew install --cask trader-workstation@stable
```

### Updates

Whenever IBKR releases a new stable version and this repository is updated, you can upgrade your installation using standard Homebrew commands:

```bash
brew upgrade trader-workstation@stable
```

## Why does this exist?

The official `homebrew-cask` repository currently only distributes the `latest` version of [Trader Workstation](https://github.com/Homebrew/homebrew-cask/blob/main/Casks/t/trader-workstation.rb). While that works for some, IBKR's update mechanism can be problematic for active traders:

1. **Avoiding Market Open Delays:** The "Latest" track updates very frequently and applies those updates automatically upon login. Traders often open the platform right before the bell, only to be delayed or temporarily locked out by a mandatory, time-consuming update.
2. **API Reliability:** For users leveraging the TWS-API for automated scripts or options strategies, an ever-changing interface in the "Latest" version can unexpectedly break integrations.

### The Stable Track

This tap provides the **Updatable Stable** version of TWS. As officially described by IBKR, this track _"prioritizes reliability over new features"_ and updates much less frequently (typically every few months).

It acts more like an LTS (Long Term Support) release, giving you a predictable and reliable trading environment without sacrificing the convenience of Homebrew package management.

#### IBKR's positioning of the Stable track is as follows:

_"A stable version of TWS with less frequent updates that prioritizes reliability over new features. It updates automatically upon logging in when a new version becomes available."_

> **Note:** If you would like to see the `@stable` track integrated into the official Homebrew repository, please upvote [Pull Request #278517](https://github.com/Homebrew/homebrew-cask/pull/278517).
