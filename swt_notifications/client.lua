RegisterNetEvent("swt_notifications:default")
AddEventHandler("swt_notifications:default", function(message,position,color,textColor,timeout,progress,sound,customSound)
    Default(message,position,color,textColor,timeout,progress,sound,customSound)
end)

function Default(message,position,color,textColor,timeout,progress,sound,customSound)
    SendNUIMessage({
        response = "show_default_notification",
        data = {
            message = message,
            position = position,
            color = color,
            textColor = textColor,
            timeout = timeout,
            progress = progress,
        }
    })
    if sound or customSound then HandleSounds(sound, customSound) end
end

RegisterNetEvent("swt_notifications:caption")
AddEventHandler("swt_notifications:caption", function(caption,message,position,timeout,color,textColor,progress,sound,customSound)
    Caption(caption,message,position,timeout,color,textColor,progress,sound,customSound)
end)

function Caption(caption,message,position,timeout,color,textColor,progress,sound,customSound)
    SendNUIMessage({
        response = "show_caption_notification",
        data = {
            caption = caption,
            message = message,
            position = position,
            color = color,
            textColor = textColor,
            timeout = timeout,
            progress = progress,
        }
    })
    if sound or customSound then HandleSounds(sound, customSound) end
end

RegisterNetEvent("swt_notifications:Warning")
AddEventHandler("swt_notifications:Warning", function(caption,message,position,timeout,progress,sound,customSound)
    Warning(caption,message,position,timeout,progress,sound,customSound)
end)

function Warning(caption,message,position,timeout,progress,sound,customSound)
    SendNUIMessage({
        response = "show_warning",
        data = {
            caption = caption,
            message = message,
            position = position,
            timeout = timeout,
            progress = progress,
        }
    })
    if sound or customSound then HandleSounds(sound, customSound) end
end

RegisterNetEvent("swt_notifications:Success")
AddEventHandler("swt_notifications:Success", function(caption,message,position,timeout,progress,sound,customSound)
    Success(caption,message,position,timeout,progress,sound,customSound)
end)

function Success(caption,message,position,timeout,progress,sound,customSound)
    SendNUIMessage({
        response = "show_success",
        data = {
            caption = caption,
            message = message,
            position = position,
            timeout = timeout,
            progress = progress,
        }
    })
    if sound or customSound then HandleSounds(sound, customSound) end
end

RegisterNetEvent("swt_notifications:Info")
AddEventHandler("swt_notifications:Info", function(caption,message,position,timeout,progress,sound,customSound)
    Info(caption,message,position,timeout,progress,sound,customSound)
end)

function Info(caption,message,position,timeout,progress,sound,customSound)
    SendNUIMessage({
        response = "show_info",
        data = {
            caption = caption,
            message = message,
            position = position,
            timeout = timeout,
            progress = progress,
        }
    })
    if sound or customSound then HandleSounds(sound, customSound) end
end

RegisterNetEvent("swt_notifications:Negative")
AddEventHandler("swt_notifications:Negative", function(caption,message,position,timeout,progress,sound,customSound)
    Negative(caption,message,position,timeout,progress,sound,customSound)
end)

function Negative(caption,message,position,timeout,progress,sound,customSound)
    SendNUIMessage({
        response = "show_negative",
        data = {
            caption = caption,
            message = message,
            position = position,
            timeout = timeout,
            progress = progress,
        }
    })
    if sound or customSound then HandleSounds(sound, customSound) end
end

RegisterNetEvent("swt_notifications:captionIcon")
AddEventHandler("swt_notifications:captionIcon", function(caption,message,position,timeout,color,textColor,progress,icon,sound,customSound)
    CaptionIcon(caption,message,position,timeout,color,textColor,progress,icon,sound,customSound)
end)

function CaptionIcon(caption,message,position,timeout,color,textColor,progress,icon,sound,customSound)
    SendNUIMessage({
        response = "show_icon_caption_notification",
        data = {
            caption=caption,
            message = message,
            position = position,
            color = color,
            textColor = textColor,
            timeout = timeout,
            progress = progress,
            icon = icon
        }
    })
    if sound or customSound then HandleSounds(sound, customSound) end
end

RegisterNetEvent("swt_notifications:Icon")
AddEventHandler("swt_notifications:Icon", function(message,position,timeout,color,textColor,progress,icon,sound,customSound)
    Icon(message,position,timeout,color,textColor,progress,icon,sound,customSound)
end)

function Icon(message,position,timeout,color,textColor,progress,icon,sound,customSound)
    SendNUIMessage({
        response = "show_icon_icon_notification",
        data = {
            message = message,
            position = position,
            color = color,
            textColor = textColor,
            timeout = timeout,
            progress = progress,
            icon = icon
        }
    })
    HandleSounds(sound, customSound)
end

function HandleSounds(sound, customSound)
    if sound then
        if type(sound) == 'table' then
            PlaySoundFrontend(-1, sound.name, sound.reference, 1)
        elseif sound == true then
            PlaySoundFrontend(-1, Config.Sound.name, Config.Sound.reference, 1)
        end
    elseif customSound then
        if Config.CustomSound.useInteract then
            if type(customSound) == 'table' then
                TriggerServerEvent('InteractSound_SV:PlayOnSource', customSound.sound, customSound.volume)
            elseif customSound == true then
                TriggerServerEvent('InteractSound_SV:PlayOnSource', Config.CustomSound.audioName, Config.CustomSound.volume)
            end
        else
            -- Put your custom event here
        end
    end
end