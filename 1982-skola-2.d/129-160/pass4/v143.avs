LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v143 = LSMASHVideoSource(dst_dir + "v143rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v143f.mp4")
v143 = ImageSource(file = dst_dir + "v143-png\v143-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v143 = v143.convertToY.adjustSize

#v143 = v143.extractY.convertToYV12(interlaced=false)
#v143 = v143.deScratch.extractY

v143 = v143.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v143 = v143.convertBits(8).convertToYV12(interlaced=false)

v143 = v143.deScratch.extractY
v143 = v143.removeDirt
v143 = v143.convertToYV12(interlaced=false)
v143 = v143.UnsharpMask(strength=400, radius=5, threshold=1)
v143 = v143.adjustBorders
#v143 = v143.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v143 = v143.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v143, audio_rate = 48000, channels = 2).killVideo
v143 = v143.audioDub(va)

return v143.Prefetch

