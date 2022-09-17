LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v129 = LSMASHVideoSource(dst_dir + "v129rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v129f.mp4")
v129 = ImageSource(file = dst_dir + "v129-png\v129-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v129 = v129.convertToY.adjustSize

#v129 = v129.extractY.convertToYV12(interlaced=false)
#v129 = v129.deScratch.extractY

v129 = v129.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v129 = v129.convertBits(8).convertToYV12(interlaced=false)

v129 = v129.deScratch.extractY
v129 = v129.removeDirt
v129 = v129.convertToYV12(interlaced=false)
v129 = v129.UnsharpMask(strength=400, radius=5, threshold=1)
v129 = v129.adjustBorders
#v129 = v129.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v129 = v129.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v129, audio_rate = 48000, channels = 2).killVideo
v129 = v129.audioDub(va)

return v129.Prefetch

