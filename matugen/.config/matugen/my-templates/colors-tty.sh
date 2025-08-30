#!/bin/sh
printf '%b' '\e]P0{on_primary.strip}
                 \e]P1{on_primary_container.strip}
                 \e]P2{on_primary_fixed.strip}
                 \e]P3{on_primary_fixed_variant.strip}
                 \e]P4{on_secondary.strip}
                 \e]P5{on_secondary_container.strip}
                 \e]P6{source_color.strip}
                 \e]P7{on_secondary_fixed_variant.strip}
                 \e]P8{on_surface.strip}
                 \e]P9{on_surface_variant.strip}
                 \e]PA{on_tertiary.strip}
                 \e]PB{on_tertiary_container.strip}
                 \e]PC{on_tertiary_fixed.strip}
                 \e]PD{on_tertiary_fixed_variant.strip}
                 \e]PE{outline.strip}
                 \e]PF{outline_variant.strip}
                 \ec'
