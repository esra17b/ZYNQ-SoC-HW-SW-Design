# ZYNQ SoC HW/SW Design

My hands-on work for the **ZYNQ SoC HW/SW Design** (*ZYNQ SoC HW/SW Tasarımı*) course, a YouTube lecture series by **Mehmet Burak Aykenar**. Each lesson folder holds the sources, build script, results, and notes from my own run of that lesson.

## Lessons

| Lesson | Topic | Summary |
| --- | --- | --- |
| [Lesson 3](lesson_03_switch_to_led/) | Switch to LED | First PL design: registered switch inputs drive the LEDs, built and programmed with Vivado |

## Setup

- **Board:** Avnet ZedBoard
- **Device:** Zynq-7000 `xc7z020clg484-1`
- **Tools:** Vivado 2023.2

## Repository layout

Every lesson follows the same structure, keeping only the folders it needs:

```text
lesson_XX_name/
├── README.md      Lesson notes and results
├── src/           HDL sources
├── constraints/   Pin and timing constraints
├── scripts/       Vivado build scripts
├── bitstream/     Pre-built bitstream
├── reports/       Vivado reports
└── images/        Screenshots
```

Vivado's generated project files are not tracked. Each design can be rebuilt from its sources with the lesson's build script.

## Course resources

- The lectures are on the **Mehmet Burak Aykenar** YouTube channel.
- [Course code by the instructor](https://github.com/mbaykenar/zynq-soc-hw-sw-design)
- [*From Gates to Silicons*](https://leanpub.com/fromgatestosilicons), a free book compiled from the instructor's lecture series

This repository is a personal study record and is not an official course resource.
