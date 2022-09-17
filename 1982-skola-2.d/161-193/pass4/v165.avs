LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v165 = LSMASHVideoSource(dst_dir + "v165rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v165f.mp4")
v165 = ImageSource(file = dst_dir + "v165-png\v165-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v165 = v165.convertToY.adjustSize

#v165 = v165.extractY.convertToYV12(interlaced=false)
#v165 = v165.deScratch.extractY

v165 = v165.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v165 = v165.convertBits(8).convertToYV12(interlaced=false)

v165 = v165.deScratch.extractY
v165 = v165.removeDirt
v165 = v165.convertToYV12(interlaced=false)
v165 = v165.UnsharpMask(strength=400, radius=5, threshold=1)
v165 = v165.adjustBorders
#v165 = v165.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v165 = v165.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v165, audio_rate = 48000, channels = 2).killVideo
v165 = v165.audioDub(va)

return v165.Prefetch

