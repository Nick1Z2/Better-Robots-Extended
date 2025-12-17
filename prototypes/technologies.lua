require("technology.BRE-construction-robotics")
require("technology.BRE-logistic-robotics")
require("technology.BRE-roboport")
require("technology.BRE-robo-Box")
require("technology.BRE-robo-Erweiterung")
require("technology.BRE-robo-Lader")

if settings.startup["BRE-Arbeitsroboter-Transportmenge-Forschung"].value == true then
require("technology.BRE-robots-storage")
end

if settings.startup["BRE-Battery-Forschung"].value == true then
require("technology.BRE-robots-battery")
end