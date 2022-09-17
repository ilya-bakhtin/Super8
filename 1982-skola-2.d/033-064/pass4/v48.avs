LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v48 = LSMASHVideoSource(dst_dir + "v48rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v48f.mp4")
v48 = ImageSource(file = dst_dir + "v48-png\v48-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v48 = v48.convertToY.adjustSize

#v48 = v48.extractY.convertToYV12(interlaced=false)
#v48 = v48.deScratch.extractY

v48 = v48.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v48 = v48.convertBits(8).convertToYV12(interlaced=false)

v48 = v48.deScratch.extractY
v48 = v48.removeDirt
v48 = v48.convertToYV12(interlaced=false)
v48 = v48.UnsharpMask(strength=400, radius=5, threshold=1)
v48 = v48.adjustBorders
#v48 = v48.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v48 = v48.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v48, audio_rate = 48000, channels = 2).killVideo
v48 = v48.audioDub(va)

return v48.Prefetch

