require(reshape2)

## Ray's Data
ray <- read.csv("1.FuTRESEquidDbase_6_24_2019.csv", stringsAsFactors = FALSE)
boneAbbr <- read.csv("BoneAbbr.csv", stringsAsFactors = FALSE)

#get rid of protected sites
ray_safe <- subset(ray, subset = ray$PROTECTED...P != "P")

#cut ray's data to just limb and dental measurements for now from "focused traits"
#https://docs.google.com/spreadsheets/d/1rU15rBo-JpopEqpxBXLWSqaecBXwtYpxBLjRImcCvDQ/edit#gid=0
Rpattern <-  "pre?molar|metacarpal|metatarsal|1st phalanx III" #? allows it to be premolar or molar (note: need all three letters: p r e)
Rx <- grep(Rpattern, boneAbbr$Bone, value = TRUE)

boneAbbr_sub <- boneAbbr[boneAbbr$Bone %in% Rx,]

ray_sub1 <- ray_safe[ray_safe$BONE %in% boneAbbr_sub$Abbreviation,]
ray_sub2 <- subset(ray_safe, subset = c(ray_safe$BONE == "tibia" | 
                                        ray_safe$BONE == "humerus" | 
                                        ray_safe$BONE == "femur" | 
                                        ray_safe$BONE == "radius"))
ray_sub <- rbind(ray_sub1, ray_sub2)

#measurements are from 13:51
ray_long <- melt(ray_sub, id.vars = c(1:12))

#select out specific measurements / change measurement names and map to template
ray_long_sub <- subset(ray_long, ray_long$BONE == "humerus" & ray_long$variable == "M1" |
                         ray_long$BONE == "humerus" & ray_long$variable == "M2" |
                         ray_long$BONE == "humerus" & ray_long$variable == "M5" |
                         ray_long$BONE == "femur" & ray_long$variable == "M1" |
                         ray_long$BONE == "femur" & ray_long$variable == "M2" |
                         ray_long$BONE == "radius" & ray_long$variable == "M10" |
                         ray_long$BONE == "tibia" & ray_long$variable == "M5" |
                         ray_long$BONE == "tibia" & ray_long$variable == "M8" |
                         ray_long$BONE == "mc2" & ray_long$variable == "M3" |
                         ray_long$BONE == "mc2or4" & ray_long$variable == "M3" |
                         ray_long$BONE == "mc3" & ray_long$variable == "M5" |
                         ray_long$BONE == "mc4" & ray_long$variable == "M3")

#next change names to match template
for(i in 1:length(ray_long_sub$SPEC_ID)) {
  if(isTRUE(ray_long_sub$BONE[i] == "humerus" & ray_long_sub$variable[i] == "M1")){
    ray_long_sub$template[i] <- "humerus length"
  }
  else if(isTRUE(ray_long_sub$BONE[i] == "humerus" & ray_long_sub$variable[i] == "M2")){
    ray_long_sub$template[i] <- "humerus length from caput"
  }
  else if(isTRUE(ray_long_sub$BONE[i] == "humerus" & ray_long_sub$variable[i] == "M5")){
    ray_long_sub$template[i] <- "humerus proximal breadth"
  }
  else if(isTRUE(ray_long_sub$BONE[i] == "tibia" & ray_long_sub$variable[i] == "M5")){
    ray_long_sub$template[i] <- "tibia distal breadth"
  }
  else if(isTRUE(ray_long_sub$BONE[i] == "tibia" & ray_long_sub$variable[i] == "M8")){
    ray_long_sub$template[i] <-"tibia proximal breadth"
  }
  else if(isTRUE(ray_long_sub$BONE[i] == "radius" & ray_long_sub$variable[i] == "M10")){
    ray_long_sub$template[i] <- "radius distal breadth"
  }
  else if(isTRUE(ray_long_sub$BONE[i] == "femur" & ray_long_sub$variable[i] == "M1")){
    ray_long_sub$template[i] <- "femur length"
  }
  else if(isTRUE(ray_long_sub$BONE[i] == "femur" & ray_long_sub$variable[i] == "M2")){
    ray_long_sub$template[i] <- "femur length from trochanter"
  }
  else if(isTRUE(ray_long_sub$BONE[i] == "mc2" & ray_long_sub$variable[i] == "M3")){
    ray_long_sub$template[i] <- "metacarpal proximal breadth"
  }
  else if(isTRUE(ray_long_sub$BONE[i] == "mc3" & ray_long_sub$variable[i] == "M5")){
    ray_long_sub$template[i] <- "metacarpal proximal breadth"
  }
  else if(isTRUE(ray_long_sub$BONE[i] == "mc4" & ray_long_sub$variable[i] == "M3")){
    ray_long_sub$template[i] <- "metacarpal proximal breadth"
  }
  else if(isTRUE(ray_long_sub$BONE[i] == "mc2or4" & ray_long_sub$variable[i] == "M3")){
    ray_long_sub$template[i] <- "metacarpal proximal breadth"
  }
}

##Kitty's data
kitty <- read.csv("MayaDeerMetrics_Cantryll_Emeryedits.csv", skip = 2, stringsAsFactors = FALSE)

#measurements are: 16:101
kitty_long <- melt(kitty, id.vars = 1:15)

#select out "focused traits"
#https://docs.google.com/spreadsheets/d/1rU15rBo-JpopEqpxBXLWSqaecBXwtYpxBLjRImcCvDQ/edit#gid=0
Kpattern <- "(?i)humerus|metacarpal|femur|astragalus|calcaneum" #(?i) makes it case insensitive
Kx <- grep(Kpattern, kitty_long$variable, value = TRUE)

kitty_sub <- kitty_long[kitty_long$variable %in% Kx,]

K2pattern <- "Femur.GLC|Femur.GL|Humerus.GLC|Humerus.GL|Metacarpal.BFp|Humerus.Bp" #check metacarpal BFp
K2x <- grep(K2pattern, kitty_sub$variable, value = TRUE)

kitty_sub2 <- kitty_sub[kitty_sub$variable %in% K2x,]

kitty_sub2$template[kitty_sub2$variable == "Femur.GLC"] <- "Femur length from trochanter"
kitty_sub2$template[kitty_sub2$variable == "Femur.GL"] <- "Femur length"
kitty_sub2$template[kitty_sub2$variable == "Humerus.GLC"] <- "Humerus length from caput"
kitty_sub2$template[kitty_sub2$variable == "Humerus.GL"] <- "Humerus length"

kitty_clean <- kitty_sub2[!(is.na(kitty_sub2$value)),]

## VertNet data
vertnet <- read.csv("mammals_no_bats_2019-03-13.csv", stringsAsFactors = FALSE)

#rearrange columns
#need to put catalognumber [18], lat [20], long[21], collection code [19], institution code [59], scientific name [71], locality [63], occurrence id [65]
df <- vertnet[,c(18:21,43,59,63,66,67,71,1:17,22:42,44:58,60:62,64,65,68:70,72:119)]

#select out "focused traits"
#https://docs.google.com/spreadsheets/d/1rU15rBo-JpopEqpxBXLWSqaecBXwtYpxBLjRImcCvDQ/edit#gid=0
needs <- df[,1:10]

cols <- colnames(vertnet)
Vpattern <- "hind_foot_length|ear_length|body_mass|lifestage|tail_length|total_length"
Vx <- grep(Vpattern, cols, value = TRUE)

vertnet_sub <- vertnet[,vertnet %in% Vx]

#create long version (1:10 are keepers)
vertnet_long <- melt(df, id.vars = 1:10)



##NEXT: select out specific measurements / change measurement names and map to template

#probably want to use the gather() function from tidyverse

data %>% gather(Measurement, Value, M1:M23)