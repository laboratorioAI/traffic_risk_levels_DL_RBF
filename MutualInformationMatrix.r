library(readxl)
library(corrplot)
library(RColorBrewer)

datos <- read.csv(file = "C:/Users/Cristian/Documents/EPN/Maestría en Computación/OneDrive - Escuela Politécnica Nacional/2022-B/Tesis/Dataset/20221215_151443_clustering.csv") # nolint: line_length_linter.
datos <- datos[, c(
    "steering_angle", "speed", "rpm", "acceleration", "throttle_position", "engine_temperature", "system_voltage", "barometric_pressure", # nolint: line_length_linter, indentation_linter.
    "distance_travelled", "latitude", "longitude", "heart_rate", "current_weather", "temperature", # nolint: line_length_linter, indentation_linter.
    "real_feel_temperature", "wind_speed", "relative_humidity", "uv_index", "cloud_cover", "ceiling", "pressure", "precipitation", "accidents_onsite" # nolint: line_length_linter, indentation_linter.
)]

# Correlation Graph
png(height = 1024, width = 1024, file = "C:/Users/Cristian/Documents/EPN/Maestría en Computación/OneDrive - Escuela Politécnica Nacional/2022-B/Tesis/Images/MI_matrix.png") # nolint: line_length_li.
corr <- round(cor(datos), 1)

variables_correlograma.plot <- corrplot(corr, # nolint: object_name_linter.
    type = "upper", # nolint: indentation_linter.
    is.corr = FALSE,
    order = "hclust",
    addCoef.col = TRUE,
    method = "square",
    col = colorRampPalette(c(
        brewer.pal(7, "Set2")[2], # nolint: indentation_linter.
        "white", brewer.pal(7, "Set2")[1]
    ))(100), # nolint: indentation_linter.
    tl.col = "black",
    tl.srt = 60,
    number.cex = 0.75,
    diag = TRUE
    #title = "Mutual Information Matrix" # nolint: commented_code_linter.
)
variables_correlograma.plot
dev.off()