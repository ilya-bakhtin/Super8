LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v155 = LSMASHVideoSource(dst_dir + "v155rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v155f.mp4")
v155 = ImageSource(file = dst_dir + "v155-png\v155-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v155 = v155.convertToY.adjustSize

#v155 = v155.extractY.convertToYV12(interlaced=false)
#v155 = v155.deScratch.extractY

v155 = v155.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v155 = v155.convertBits(8).convertToYV12(interlaced=false)

v155 = v155.deScratch.extractY
v155 = v155.removeDirt
v155 = v155.convertToYV12(interlaced=false)
v155 = v155.UnsharpMask(strength=400, radius=5, threshold=1)
v155 = v155.adjustBorders
#v155 = v155.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v155 = v155.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v155, audio_rate = 48000, channels = 2).killVideo
v155 = v155.audioDub(va)

return v155.Prefetch

