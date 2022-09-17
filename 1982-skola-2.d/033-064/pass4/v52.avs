LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v52 = LSMASHVideoSource(dst_dir + "v52rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v52f.mp4")
v52 = ImageSource(file = dst_dir + "v52-png\v52-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v52 = v52.convertToY.adjustSize

#v52 = v52.extractY.convertToYV12(interlaced=false)
#v52 = v52.deScratch.extractY

v52 = v52.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v52 = v52.convertBits(8).convertToYV12(interlaced=false)

v52 = v52.deScratch.extractY
v52 = v52.removeDirt
v52 = v52.convertToYV12(interlaced=false)
v52 = v52.UnsharpMask(strength=400, radius=5, threshold=1)
v52 = v52.adjustBorders
#v52 = v52.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v52 = v52.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v52, audio_rate = 48000, channels = 2).killVideo
v52 = v52.audioDub(va)

return v52.Prefetch

