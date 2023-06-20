# Choco Quick Setup

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<br />
<p align="center">
  <a href="https://github.com/lippielip/choco-quickstart">
    <img src="images/choco.png" alt="Chocolatey Logo" width="240" height="240">
  </a>

  <h2 align="center">Choco Quick Setup</h2>

  <p align="center">
    Quickly set up your Windows machine with Chocolatey and your favorite packages!
    <br />
    <!-- <a href="https://github.com/lippielip/choco-quickstart"><strong>Explore the docs »</strong></a> -->
    <!-- <br /> -->
    <br />
    <a href="https://github.com/lippielip/choco-quickstart/issues">Report Bug</a>
  </p>
</p>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-script">About The Script</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

## About The Script

This script lets you quickly set up your Windows machine with Chocolatey and the packages you specify. It's perfect for quickly setting up fresh Windows installations with the software you need.

## Getting Started

Follow these steps to use the script:

### Prerequisites

1. PowerShell (Windows 7 SP1 and Windows Server 2008 R2 SP1 and higher comes with PowerShell pre-installed)

### Setup

1. Clone this repo or download `setup.ps1` and `packages.txt` files
2. Edit `packages.txt` and add the packages you want to install, one per line

## Usage

### Local Setup

1. Run PowerShell with administrator privileges
2. Navigate to the directory where you downloaded `setup.ps1` and `packages.txt`
3. Run the following command:

```powershell
.\setup.ps1 -local
```

### Web Setup

If you have uploaded your edited `setup.ps1` and `packages.txt` to a GitHub repository, you can run the setup directly from PowerShell with this command (change the url to your repo unless you want to download my choice of software):

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/lippielip/choco-quickstart/master/setup.ps1'))
```

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Project Link: [https://github.com/lippielip/choco-quickstart](https://github.com/lippielip/choco-quickstart)

---

[contributors-shield]: https://img.shields.io/github/contributors/lippielip/choco-quickstart.svg?style=for-the-badge
[contributors-url]: https://github.com/lippielip/choco-quickstart/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/lippielip/choco-quickstart.svg?style=for-the-badge
[forks-url]: https://github.com/lippielip/choco-quickstart/network/members
[stars-shield]: https://img.shields.io/github/stars/lippielip/choco-quickstart.svg?style=for-the-badge
[stars-url]: https://github.com/lippielip/choco-quickstart/stargazers
[issues-shield]: https://img.shields.io/github/issues/lippielip/choco-quickstart.svg?style=for-the-badge
[issues-url]: https://github.com/lippielip/choco-quickstart/issues
[license-shield]: https://img.shields.io/github/license/lippielip/choco-quickstart.svg?style=for-the-badge
[license-url]: https://github.com/lippielip/choco-quickstart/blob/master/LICENSE
