LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v101 = LSMASHVideoSource(dst_dir + "v101rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v101f.mp4")
v101 = ImageSource(file = dst_dir + "v101-png\v101-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v101 = v101.convertToY.adjustSize

#v101 = v101.extractY.convertToYV12(interlaced=false)
#v101 = v101.deScratch.extractY

v101 = v101.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v101 = v101.convertBits(8).convertToYV12(interlaced=false)

v101 = v101.deScratch.extractY
v101 = v101.removeDirt
v101 = v101.convertToYV12(interlaced=false)
v101 = v101.UnsharpMask(strength=400, radius=5, threshold=1)
v101 = v101.adjustBorders
#v101 = v101.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v101 = v101.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v101, audio_rate = 48000, channels = 2).killVideo
v101 = v101.audioDub(va)

return v101.Prefetch

